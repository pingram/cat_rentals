class CatRentalRequestsController < ApplicationController

  def new
    @cat_rental_request = CatRentalRequest.new()
    @all_cat_ids = Cat.all.pluck(:id)
    render :new
  end



  # def create
  #   @cat_rental_request = CatRentalRequest.new(cat_params)
  #   if @cat_rental_request.save
  #     redirect_to cat_url(@cat_rental_request)
  #   else
  #     # flash[:errors] = @cat.errors.full_messages
  #     redirect_to new_cat_url#, alert: "You're stuck here!"
  #   end
  # end

end
