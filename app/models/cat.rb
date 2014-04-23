class Cat < ActiveRecord::Base
  validates :age, :birth_date, :color, :name, :sex, presence: true
  validates :age, numericality: { only_integer: true }
  validates :color, inclusion: { in: %w(black brown white tabby blue) }
  validates :sex, inclusion: { in: %w(M F) }
end
