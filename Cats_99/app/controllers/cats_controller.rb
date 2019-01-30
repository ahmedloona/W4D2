class CatsController < ApplicationController
  
  def index 
    @cats = Cat.all
  end 

  def show 
    @cat = Cat.find_by(id: params[:id])
    render :show
  end

  def new 
    @cat = Cat.new
  end
  
  def create 
    @cat = Cat.new(params.require(:cat).permit(:name,:birth_date,:sex,:color,:description))

    if @cat.save
      render :show
    else  
      render json: @cat.errors.full_messages 
    end
  end
   

  def edit
    @cat = Cat.find_by(id: params[:id])
   
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    if @cat.update(params.require(:cat).permit(:name,:birth_date,:sex,:color,:description))
      render :show
    else
      render json: @cat.errors.full_messages
    end
  end
end