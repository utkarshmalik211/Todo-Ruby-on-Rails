class TodoItemsController < ApplicationController
  def index
    @todo_list=TodoList.find(params[:todo_list_id])
  end
  def new
    @todo_list=TodoList.find(params[:todo_list_id])
    @todo_item=@todo_list.todo_items.new
  end
  def edit
    #@todo_list=TodoList.find(params[:todo_list_id])

    #@todo_item=@todo_list.todo_items.find
  end
  def create
    @todo_list=TodoList.find(params[:todo_list_id])
    @todo_item=@todo_list.todo_items.new(todo_item_params)
    if @todo_item.save
      flash[:success] = "Added new todo item"
      redirect_to todo_list_todo_items_path
    else
      flash[:error] = "Problem adding. Minimum 3 chars required!"
      render action: :new
    end
  end
  private
  def todo_item_params
    params[:todo_item].permit(:content)
  end
end
