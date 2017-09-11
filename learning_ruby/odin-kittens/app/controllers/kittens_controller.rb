class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do  |f|
      f.html
      f.json {render json: @kittens}
   end
  end
  def new
    @kitten = Kitten.new
  end
  def create
    
    kitten = Kitten.new(user_params)
    if kitten.save
      redirect_to kitten_path(kitten)
    else
      render 'new'
    end
  end
  def edit
    @kitten = Kitten.find_by(id: params[:id])
  end
  def update
    kitten = Kitten.find_by(id: params[:id])
    if kitten.update_attributes(user_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end
  def show
    @kitten = Kitten.find_by(id: params[:id])
    respond_to do  |f|
      f.html
      f.json {render json: @kitten}
   end
  end
  def destroy
    Kitten.find_by(id: params[:id]).destroy
    redirect_to root_url
  end

  private

  def user_params
    params.require(:kitten).permit(:name,:age,:cuteness,:softness)
  end
end
