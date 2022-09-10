class ThrowsController < ApplicationController
  before_action :authenticate_user

  def create
    if params[:clutch_called] && params[:points] != 7 || !params[:clutch_called] && params[:points] == 7
      true_points = 0
    else
      true_points = params[:points]
    end
    throw = Throw.new(
      training_id: params[:training_id],
      points: true_points,
      clutch_called: params[:clutch_called] || false,
      big_axe: params[:big_axe] || false
    )
    if throw.save
      render json: throw
    else
      render json: {errors: throw.errors.full_messages}, status: :bad_request
    end
  end

  def update
    throw = Throw.find(params[:id])
    throw.points = params[:points] || throw.points
    throw.clutch_called = params[:clutch_called] || throw.clutch_called
    throw.big_axe = params[:big_axe] || throw.big_axe
    if throw.save
      render json: throw
    else
      render json: {errors: throw.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    throw = Throw.find(params[:id])
    throw.destroy
    render json: {message: "Throw has been obliterated to infinity and beyond and back once again"}
  end
end
