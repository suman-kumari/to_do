# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  hashed_password :string(255)
#  salt            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe User do
  let(:user) { create(:user) }
  
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
 
  it { should have_many(:todos).dependent(:destroy) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }

  it { should validate_presence_of(:password) }
  it { should ensure_length_of(:password).is_at_least(6) }
  it { should validate_confirmation_of(:password) }
  
  describe ".authenticate" do
  
    it "should exist" do
      User.should respond_to(:authenticate)
    end
    
    it "should return the user on email/password match" do
      User.authenticate(user.email,user.password).should == user
    end
  end
  
  describe ".encrypt_password" do
    it "should generate hashed_password" do
      User.encrypt_password(user.password,user.salt).should == user.hashed_password
    end
  end
end
 
