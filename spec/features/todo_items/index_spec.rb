require "Spec_helper"

describe "viewing todo items" do
  let!(:todo_list) { TodoList.create( title:"hi all" , description:"how are you" ) }
  def test_proc
    visit "/todo_lists"
    within "#todo_list_#{todo_list.id}" do
      click_link "List Items"
    end
  end
  it "deisplays no items when list is empty" do
    test_proc
    expect(TodoItem.count).to eq(0)
  end
  it "displays the todo list title on the page" do
    test_proc
    expect(page).to have_content(todo_list.title)
  end
  it "has items when we have added some" do
    todo_list.todo_items.create(content:"milk")
    todo_list.todo_items.create(content:"eggs")

    test_proc

    expect(TodoItem.count).to eq(2)
    expect(page).to have_content("milk")
    expect(page).to have_content("eggs")

  end
end
