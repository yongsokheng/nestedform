class User < ActiveRecord::Base
  has_many :user_groups
  has_many :groups, through: :user_groups

  validates :name, presence: true

  include PublicActivity::Model
 tracked owner: ->(controller, model) {User.first}
end
