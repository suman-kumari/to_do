module IntegrationHelper
  def login_user(user = nil)
    visit login_path
    fill_in "Email", :with => "#{user.email}"
    fill_in "Password", :with => "#{user.password}"
    click_on "Sign in"
  end
end
