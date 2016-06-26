require 'spec_helper'

describe "editing todo list" do
  let!(:todo_list) {TodoList.create(title:"nice locus",description:"hehehehe")}

  def edit_tdl(options={})
    options[:title] ||="new tit"
    options[:description] ||="you semm attrs"
    visit "/todo_lists"
    within "#todo_list_#{todo_list.id}" do
      click_link "Edit"
    end
    fill_in "Title",with:options[:title]
    fill_in "Description",with:options[:description]
    click_button "Update Todo list"
  end

  it "updates todo list successfully with correct params" do
    edit_tdl
    expect(page).to have_content("Todo list was successfully updated.")
    todo_list.reload
    expect(todo_list.title).to eq("new tit")
    expect(todo_list.description).to eq("you semm attrs")
  end
  it "shows error when title is less than 3 length" do
    edit_tdl title:"hi"
    expect(page).to have_content("error")
  end
  it "shows error when desc is less than 5 length" do
    edit_tdl description:"hi l"
    expect(page).to have_content("error")
  end



end
