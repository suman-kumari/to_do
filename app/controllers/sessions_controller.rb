class SessionsController < ApplicationController
skip_before_filter :authorize

  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to todo_user_path(user)
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end
end
