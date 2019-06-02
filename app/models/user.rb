class User < ApplicationRecord
  has_many :projects
  has_many :tasks, through: :projects
  has_many :task_tags, through: :tasks
  has_many :tags, through: :task_tags

  validates :name, presence: true, allow_blank: false
  validates :name, uniqueness: true

  validates :user_name, uniqueness: true
  has_secure_password  # Macro that gives you access to a few methods
  
end
