class Api::V1::HabbitsController < ApplicationController
  before_action :set_habit, only: [:show, :update, :destroy]
  
  def index
    habbits = Habbit.all
    render json: habbits, status: 200
  end

  def show
  end

  def create
    habbit = Habbit.new(
        name: habbit_params[:name],
        is_completed: habbit_params[:is_completed]
    )
    if habbit.save
        render json:habbit, status: 200
    else
        render json: {
            error: "Error creating..."
        }
    end
  end

   def update
    if @habit.update(habbit_params)
      render json: @habit
    else
      render json: @habit.errors, status: :unprocessable_entity
    end
  end

  def destroy
    habbit = Habbit.find(params[:id])
    habbit.destroy
    head :no_content
  end


  private

    def set_habit
    @habit = Habbit.find(params[:id])
  end

  def habbit_params
    params.require(:habbit).permit(:name, :is_completed)
  end
end