class UsersController < ApplicationController
  before_action :authenticate_user, except: :create

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @user = current_user
    render template: "users/show"
  end

  def update
    @user = current_user
    @user.name = params[:name] || @user.name
    if @user.save
      render template: "users/show"
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    user = current_user
    user.destroy
    render json: {message: "YOU has been obliterated to infinity and beyond and back once again"}
  end
end
