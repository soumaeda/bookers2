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
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to user_path(current_user)
    end
    @user = User.find(params[:id])
  end
  
  def update
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to user_path(current_user)
    end
    @user = User.find(params[:id])
    @user.id = current_user.id
    if @user.update(user_params)
      flash[:notice] = "updated successfully!!"
      redirect_to user_path(current_user)
    else
      render :edit
    end
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)  
  end
end
