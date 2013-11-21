require 'spec_helper'

feature "User" do
  let!(:user) { create(:user) }
  
  scenario "creating user with correct credentials" do
    visit new_user_path
    current_path.should == new_user_path
    
    fill_in "user_first_name", :with => Faker::Name.first_name
    fill_in "user_last_name", :with => Faker::Name.last_name
    fill_in "user_email", :with => Faker::Internet.email
    fill_in "user_password", :with => "secret"
    fill_in "user_password_confirmation", :with => "secret"
    click_button("submit")
    current_path.should == users_path
    page.should have_selector('h1', :text => "Users")
    page.should have_selector('th', :text => "Email")
    page.should have_content("user was successfully created")
  end

  scenario "editing" do
    login_user(user)
    visit edit_user_path(user)
    within("#edit_user_#{user.id}") do
      fill_in "user_password", :with => "kreeti"
      fill_in "user_password_confirmation", :with => "kreeti"
      click_button("submit")
    end
    current_path.should == users_path
    page.should have_content("user was successfully updated")
    page.should have_selector('h1', :text => "Users")
  end

   scenario "destroy" do
    login_user(user)
    visit users_path
    user1 = User.create(:first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :email =>  Faker::Internet.email, :password => "kreeti", :password_confirmation => "kreeti")
    expect { user.destroy }.to change(User, :count).by(-1)
  end
end
  
