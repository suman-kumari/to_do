class UsersController < ApplicationController
before_action :set_user, only: [:edit, :update, :destroy, :todo]
skip_before_filter :authorize, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       redirect_to users_path
    else
      render action: 'new' 
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to(users_url) }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def todo
    @todos = @user.todos
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

