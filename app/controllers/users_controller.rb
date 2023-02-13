class UsersController < ApplicationController
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = @user.books
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.id = current_user.id
    @user.update(user_params)
    flash[:notice] = "updated successfully!"
    redirect_to user_path(current_user)
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)  
  end
end
