class UsersController < ApplicationController
before_action :set_user, only: [:edit, :update, :destroy, :todo]
skip_before_filter :authorize, only: [:new, :create, :index]

  def index
    @users = User.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       redirect_to users_path, :alert => "user was successfully created"
    else
      render action: 'new' 
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, :alert => "user was successfully updated" 
    else
      render action: 'edit' 
    end
  end
  
  def destroy
    @user.destroy
    redirect_to users_path
  end

  def todo
    @todos = @user.todos.paginate(:page => params[:page], :per_page => 10)
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

