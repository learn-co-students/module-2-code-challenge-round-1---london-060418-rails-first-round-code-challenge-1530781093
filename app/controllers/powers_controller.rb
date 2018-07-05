class PowersController < ApplicationController

  def index
      @powers = if params[:term]
          Power.where('name LIKE ?', "%#{params[:term]}%")
      else
          Power.all
      end
  end

  def new
      @power = Power.new
  end

  def create
      power = Power.create(power_params)
      if(power.valid?)
          redirect_to power_path(power)
      else
          flash[:errors] = power.errors.full_messages
          redirect_to new_power_path
      end
  end

  def edit
     @power = Power.find(params[:id])
  end

  def update
      power = Power.find(params[:id])
      power.update(power_params)
      if(power.valid?)
          redirect_to power_path(power)
      else
          flash[:errors] = power.errors.full_messages
          redirect_to new_power_path
      end

  end

  def show
      @power = Power.find(params[:id])

  end

  def destroy
      power = Power.find(params[:id])
      power.destroy
      redirect_to powers_path
  end

  private

  def power_params
      params.require(:power).permit(:name, :description)
  end


end
