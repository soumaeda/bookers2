class UsersController < ApplicationController
  
  def index
    @user = current_user
    @users = User.all
    @books = @user.books
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.id = current_user.id
    @user.update(user_params)
    redirect_to user_path(current_user)
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)  
  end
end
