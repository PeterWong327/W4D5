class UsersController < ApplicationController
  def new
    render :new
  end 
  
  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_url(user), status:302 #code: found
    else
      flash[:errors] = user.errors.full_messages
      render :new, status:422 #code: unprocessable entity
    end 
  end 
  
  def show
    @user = User.find(params[:id])
    render :show
  end
  
  def index
    render :index
  end
  
  def user_params
    params.require(:user).permit(:username, :password)
  end 
end
