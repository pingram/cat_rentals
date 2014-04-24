class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED)}
  validate :overlapping_approved_requests

  belongs_to :cat

  def approve!
    self.status = "APPROVED"
    self.save
  end

  def overlapping_requests
    query = <<-SQL
      SELECT
        cr1.*
      FROM
        cat_rental_requests cr1
      WHERE
        (? BETWEEN cr1.start_date AND cr1.end_date OR
        ? BETWEEN cr1.start_date AND cr1.end_date) AND
        ? = cr1.cat_id
    SQL

    CatRentalRequest.find_by_sql([query,
                                  self.start_date.to_s,
                                  self.end_date.to_s,
                                  self.cat_id])
  end

  def overlapping_approved_requests
    new_oar = overlapping_requests.select do |request|
      request.status == "APPROVED" && request.id != self.id
    end
    if new_oar.count > 0
      errors[:start_date] << "the cat is already reserved for that date"
    end
  end
end