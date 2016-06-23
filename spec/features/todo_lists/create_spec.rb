require 'spec_helper'


describe "creating todo lists" do
  it "redirects to the todo_lists on success" do
    visit "/todo_lists"
    click_link "New Todo List"
    expect(page).to have_content("New Todo List")

    fill_in "Title",with:"hey"
    fill_in "Description",with:"you are great"
    click_button "Create Todo list"

    expect(page).to have_content("Todo list was successfully created.")
  end
  it "does'nt adds entry when title is blank" do
    expect(TodoList.count).to eq(0)
    visit "/todo_lists"
    click_link "New Todo List"
    expect(page).to have_content("New Todo List")

    fill_in "Title",with:""
    fill_in "Description",with:"you are great"
    click_button "Create Todo list"
    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)
  end
  it "does'nt adds entry when title is <3 chars" do
    expect(TodoList.count).to eq(0)
    visit "/todo_lists"
    click_link "New Todo List"
    expect(page).to have_content("New Todo List")

    fill_in "Title",with:"hi"
    fill_in "Description",with:"you are great"
    click_button "Create Todo list"
    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)
  end
end
