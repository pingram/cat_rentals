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

  def new
    @cat = Cat.new()
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      # flash[:errors] = @cat.errors.full_messages
      redirect_to new_cat_url#, alert: "You're stuck here!"
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    if @cat.nil?
      redirect_to cats_index
    else
      render :edit
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      # flash[:errors] = @cat.errors.full_messages
      redirect_to new_cat_url#, alert: "You're stuck here!"
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age, :birth_date, :color, :sex)
  end

end
