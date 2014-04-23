class CatsController < ApplicationController

  def index
    @cats = Cat.all

  end

  def show
    @cat = Cat.find(params[:id])
    if @cat.nil?
      redirect_to cats_url
    else
      render :show
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age, :birth_date, :color, :sex)
  end

end
