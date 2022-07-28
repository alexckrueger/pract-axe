class TrainingsController < ApplicationController
  before_action :authenticate_user

  def index
    @trainings = current_user.trainings
    render template: "trainings/index"
  end

  def show
    @training = current_user.trainings.find(params[:id])
    render template: "trainings/show"
  end

  def create
    @training = Training.new(
      user_id: current_user.id,
      name: params[:name]
    )
    if @training.save
      render template: "trainings/show"
    else
      render json: {errors: @training.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    training = current_user.trainings.find(params[:id])
    training.destroy
    render json: {message: "Training has been obliterated to infinity and beyond and back once again"}
  end
end
