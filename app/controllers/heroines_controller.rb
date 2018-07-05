class HeroinesController < ApplicationController
    # before_action :set_heroine, only: []

  def index
      @heroines = if params[:term]
          Heroine.where('super_name LIKE ?', "%#{params[:term]}%")
      else
          Heroine.all
      end
  end

  def new
      @heroine = Heroine.new
      @powers = Power.all
  end

  def create
      heroine = Heroine.create(heroine_params)
      if(heroine.valid?)
          redirect_to heroine_path(heroine)
      else
          flash[:errors] = heroine.errors.full_messages
          redirect_to new_heroine_path
      end
  end

  def edit
      @heroine = Heroine.find(params[:id])
      @powers = Power.all
  end

  def update
      heroine = Heroine.find(params[:id])
      heroine.update(heroine_params)
      if(heroine.valid?)
          redirect_to heroine_path(heroine)
      else
          flash[:errors] = heroine.errors.full_messages
          redirect_to edit_heroine_path
      end
  end

  def show
      @heroine = Heroine.find(params[:id])
  end

  def destroy
      heroine = Heroine.find(params[:id])
      heroine.destroy
      redirect_to powers_path
  end

  private
  def heroine_params
      params.require(:heroine).permit(:name, :super_name, :power_id)
  end


end
