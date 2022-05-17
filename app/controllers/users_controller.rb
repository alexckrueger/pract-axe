class UsersController < ApplicationController

  def create
    # User create
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.name = params[:name] || user.name
    if user.save
      render json: user
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "YOU has been obliterated to infinity and beyond and back once again"}
  end
end
