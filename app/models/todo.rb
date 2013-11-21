# == Schema Information
#
# Table name: todos
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  description     :text
#  completed       :boolean          default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#  user_id         :integer
#  privacy         :boolean
#  start_date_time :date
#  end_date_time   :date
#

class Todo < ActiveRecord::Base
  belongs_to :user

  scope :public, -> { where privacy: true }
  scope :private, -> { where privacy: false }
 
  validates :title, :description, :start_date_time, :presence => true

end

