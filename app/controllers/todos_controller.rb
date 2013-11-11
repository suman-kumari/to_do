class TodosController < ApplicationController
before_action :set_todo, only: [:edit, :update, :destroy]
 def index
   @todos = Todo.paginate(:page => params[:page], :per_page => 5)
 end

 def new
   @todo = Todo.new
   render :layout => false
 end

 def create
   @todo = Todo.new(todo_params)
   respond_to do |format|
     if @todo.save
       format.html { redirect_to todos_path }
     else
       format.html { render action: 'new' }
     end
   end
 end

 def update
   if request.xhr?
     @todo.update(completed: params[:completed])
   elsif @todo.update(todo_params)
     redirect_to todos_path
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
     format.html { redirect_to todos_url }
   end
 end

 private
 def set_todo
   @todo = Todo.find(params[:id])
 end

 def todo_params
   params.require(:todo).permit(:title, :description, :completed)
 end
end

