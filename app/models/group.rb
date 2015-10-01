class Group < ActiveRecord::Base
  has_many :user_groups
  has_many :users, through: :user_groups

  accepts_nested_attributes_for :users, allow_destroy: true

  validates :name, presence: true
end
