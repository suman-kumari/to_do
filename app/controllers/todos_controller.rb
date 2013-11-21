class TodosController < ApplicationController
skip_before_filter :authorize
before_action :set_todo, only: [:show, :edit, :update, :destroy]
before_action :get_user, only: [:new, :create, :edit, :update, :destroy]
  def index
    @todos = Todo.public.paginate(:page => params[:page], :per_page => 10)
  end  
  
  def new
    @todo = @user.todos.build
    #render layout: false
  end
  
  def create
    puts todo_params
    @todo = @user.todos.build(todo_params)
    if @todo.save
      redirect_to todo_user_path(@user), :alert => "Todo was successfully created"
    else
      render action: 'new' 
    end
  end
  
  def show
  end
  
  def update
    if request.xhr?
      @todo.update(completed: params[:completed])
    elsif @todo.update(todo_params)
      redirect_to todo_user_path(@user), :alert => "Todo was successfully updated"
    else
      render action: 'edit'
    end
  end
  
  def edit
    #render layout: false
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
    params.require(:todo).permit(:title, :description, :completed, :privacy, :start_date_time, :end_date_time, :user_id)
  end
end

