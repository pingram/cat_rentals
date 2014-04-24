class CatRentalRequestsController < ApplicationController

  def new
    @cat_rental_request = CatRentalRequest.new()
    @all_cat_ids = Cat.all.pluck(:id)
    render :new
  end



  def create
    @cat_rental_request = CatRentalRequest.new(crf_params)
    if @cat_rental_request.save
      redirect_to cats_url
    else
      redirect_to new_cat_request_form_url
    end
  end

  private

  def crf_params
    params.require(:cat_rental_request).permit(:start_date,
                                              :end_date,
                                              :cat_id,
                                              :status)
  end

end
