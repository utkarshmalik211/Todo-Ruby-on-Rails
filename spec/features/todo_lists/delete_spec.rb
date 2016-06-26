require "Spec_helper"

describe "edit tests" do
  let!(:todo_list) { TodoList.create( title:"hi all" , description:"how are you" ) }
  it "succes when clicked" do
    visit "/todo_lists"
    within "#todo_list_#{todo_list.id}" do
      click_link "Destroy"
    end

    expect(page).to_not have_content(todo_list.title)
  end

end
