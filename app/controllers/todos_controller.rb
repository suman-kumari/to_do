class TodosController < ApplicationController
before_action :set_todo, only: [:show, :edit, :update, :destroy]
 def index
   @todos = Todo.all
 end

 def new
   @todo = Todo.new
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
   respond_to do |format|
     if @todo.update(todo_params)
       format.html { redirect_to todos_path }
     else
       format.html { render action: 'edit' }
     end
   end
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

