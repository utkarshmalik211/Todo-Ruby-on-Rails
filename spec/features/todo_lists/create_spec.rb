require 'spec_helper'


describe "creating todo lists" do
  def create_tdl(options={})
    options[:title] ||="heya"
    options[:description] ||="hello hoe are you"

    visit "/todo_lists"
    click_link "New Todo List"
    expect(page).to have_content("New Todo List")

    fill_in "Title",with:options[:title]
    fill_in "Description",with:options[:description]
    click_button "Create Todo list"
  end
  it "redirects to the todo_lists on success" do
    visit "/todo_lists"
    create_tdl
    expect(page).to have_content("Todo list was successfully created.")
  end
  it "does'nt adds entry when title is blank" do
    expect(TodoList.count).to eq(0)
    create_tdl title:""
    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)
  end
  it "does'nt adds entry when title is <3 chars" do
    expect(TodoList.count).to eq(0)
    create_tdl title:"hi"
    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)
  end
  it "does'nt adds entry when Description is blank" do
    expect(TodoList.count).to eq(0)
    create_tdl description:""
    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)
  end
end
