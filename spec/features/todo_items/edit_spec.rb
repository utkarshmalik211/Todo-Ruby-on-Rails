require "Spec_helper"

describe "Editing todo items" do
  let!(:todo_list) { TodoList.create( title:"hi all" , description:"how are you" ) }
  let!(:todo_item) { todo_list.todo_items.create(content:"smd")}
  def visit_todo_list(list)
    visit "/todo_lists"
    within "#todo_list_#{list.id}" do
      click_link "List Items"
    end
  end
  it "is successfull when entered valid content" do
    visit_todo_list(todo_list)
    within "#todo_item_#{todo_item.id}" do
      click_link "Edit"
    end
    fill_in 'content' ,with:"suck it"
    click_button "Save"
    expect(page).to have_content("suck it")
    todo_item.reload
    expect(todo_item.title).to eq("suck it")
  end
end
