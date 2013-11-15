class TodosController < ApplicationController
skip_before_filter :authorize
before_action :set_todo, only: [:edit, :update, :destroy]
before_action :get_user, only: [:new, :create, :edit, :update, :destroy]
  def index
    @todos = Todo.public
  end  
  
  def new
    @todo = @user.todos.build
    render :layout => false
  end
  
  def create
    @todo = @user.todos.build(todo_params)
    respond_to do |format|
      if @todo.save
        format.html { redirect_to todo_user_path(@user) }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def update
    if request.xhr?
      @todo.update(completed: params[:completed])
    elsif @todo.update(todo_params)
      redirect_to todo_user_path(@user)
    else
      render action: 'edit'
    end
  end
  
  def edit
    render :layout => false
  end

  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todo_user_path(@user) }
    end
  end
  
  private
  def set_todo
    @todo = Todo.find(params[:id])
  end
  
  def get_user
    @user = User.find(session[:user_id])
  end
  
  def todo_params
    params.require(:todo).permit(:title, :description, :completed, :privacy, :user_id)
  end
end

