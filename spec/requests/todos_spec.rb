require 'spec_helper'

feature "Todo" do
  let!(:todo) { create(:todo) }

  scenario "creating todo with correct credentials", :js => true do
    login_user(todo.user)
    visit  new_todo_path
    within("#new_todo") do
      fill_in "todo_title", :with => Faker::Name.title
      fill_in "todo_description", :with => Faker::Lorem.paragraph
      fill_in "todo_start_date_time", :with => Date.today
      fill_in "todo_end_date_time", :with => Date.tomorrow
      select('public', :from => 'todo[privacy]')
      uncheck('todo[completed]')
      click_button("submit")
    end
    current_path.should == todo_user_path(todo.user)
    page.should have_content("Todo was successfully created")
    page.should have_selector('h1', :text => "Todos")
    page.should have_selector('td', Date.today)
  end

  scenario "editing" , :js => true do
    login_user(todo.user)
    visit edit_todo_path(todo)
    within("#edit_todo_#{todo.id}") do
      fill_in "todo_start_date_time", :with => Date.yesterday
      select('private', :from => 'todo[privacy]')
      check('todo[completed]')
      click_button("submit")
    end
    current_path.should == todo_user_path(todo.user)
    page.should have_content("Todo was successfully updated")
    page.should have_selector('h1', :text => "Todos")
    page.should have_link("#{todo.title}", href: todo_path(todo))
  end
  
  scenario "show todo list of sign-in user" do
    login_user(todo.user)
    current_path.should == todo_user_path(todo.user)
    page.find_link("#{todo.title}").click
    current_path.should == todo_path(todo)
    page.should have_selector('h2', :text => "Todo Details :")
    page.should have_selector('td', "#{todo.description}")
  end

  scenario "listing public todos of all users" do
    visit todos_path
    page.should have_selector('h1', :text => "Todos")
    page.should have_selector('td', "#{todo.description}")
  end

  scenario "destroy" do
    login_user(todo.user)
    current_path.should == todo_user_path(todo.user)
    visit todos_path
    todo1 = Todo.create(:title => Faker::Name.title, :description => Faker::Lorem.paragraph, :start_date_time => Date.today, :privacy => true, :completed => false)
    expect { todo.destroy }.to change(Todo, :count).by(-1)
  end
end
