require 'spec_helper'

describe Todo do
  let(:todo) { create(:todo) }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:privacy) }
  it { should respond_to(:completed) }
  it { should respond_to(:start_date_time) }
  it { should respond_to(:end_date_time) }

  it { should belong_to(:user) }
  
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:start_date_time) }

  describe ".private" do
    it "should return todo with private privacy" do
      Todo.private.should include(todo) 
    end
  end
end
