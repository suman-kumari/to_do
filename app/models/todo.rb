class Todo < ActiveRecord::Base
  belongs_to :user

  scope :public, -> { where privacy: true }
  scope :private, -> { where privacy: false }
 
  validates :title, :description, :presence => true

end

