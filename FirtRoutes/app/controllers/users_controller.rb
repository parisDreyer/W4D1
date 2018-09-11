class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end
  
  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render_error
    end
  end
  
  def show
    user = User.find(params[:id])
    render json: user
  end
  
  def update 
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render_error
    end
  end 
  
  def destroy
    User.destroy(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:username)
  end
  
  def render_error
    render json: user.errors.full_messages, status: :unprocessable_entity
  end
  
end