require "Spec_helper"

describe "viewing todo items" do
  let!(:todo_list) { TodoList.create( title:"hi all" , description:"how are you" ) }
  def visit_todo_list(list)
    visit "/todo_lists"
    within "#todo_list_#{list.id}" do
      click_link "List Items"
    end
  end
  it "adds a new item when filled with appropriate data" do
    visit_todo_list(todo_list)
    click_link "New Todo Item"
    fill_in "Content",with:"heya"
    click_button "Save"
    fill_in "Content",with:"hehe"
    click_button "Save"
    expect(page).to have_content("heya")
    expect(page).to have_content("hehe")
    expect(TodoItem.count).to eq(2)
  end
end
