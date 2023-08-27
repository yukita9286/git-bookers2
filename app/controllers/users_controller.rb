class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
 
  
  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end


  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = Book.all
    @user = current_user
   

  end

  def edit
     
    @user = User.find(params[:id])
    
  end

  def update
    
    
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(current_user.id)
    else
     render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end
  
end
