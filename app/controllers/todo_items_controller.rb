class TodoItemsController < ApplicationController
  def index
    @todo_list=TodoList.find(params[:todo_list_id])
  end
  def new
    @todo_list=TodoList.find(params[:todo_list_id])
    @todo_item=@todo_list.todo_items.new
  end
  def edit
    @todo_list=TodoList.find(params[:todo_list_id])
    @todo_item=@todo_list.todo_items.find(params[:id])
  end
  def update
    @todo_list=TodoList.find(params[:todo_list_id])
    @todo_item=@todo_list.todo_items.find(params[:id])
    if @todo_item.update_attributes(todo_item_params)
      flash[:success] = "Edited new todo item"
      redirect_to todo_list_todo_items_path
    else
      flash[:error] = "Problem editing. Minimum 3 chars required!"
      render action: :edit
    end
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
  def destroy
    #@todo_item=@todo_list.todo_items.find(params[:id])
  end
  def mark_complete
    @todo_item=@todo_list.todo_items.find(params[:id])
    @todo_item.update_attributes(:completed_at,Time.now)
    redirect_to todo_list_todo_items_path ,notice: "marked complete"
  end
  private
  def todo_item_params
    params[:todo_item].permit(:content)
  end
end
