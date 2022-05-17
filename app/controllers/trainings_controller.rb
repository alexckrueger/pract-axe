class TrainingsController < ApplicationController

  def index
    trainings = Training.all
    render json: trainings
  end

  def create
    training = Training.new(
      user_id: params[:user_id], #change to current_user
      name: params[:name]
    )
    if training.save
      render json: training
    else
      render json: {errors: training.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    training = Training.find(params[:id])
    training.destroy
    render json: {message: "Training has been obliterated to infinity and beyond and back once again"}
  end
end
