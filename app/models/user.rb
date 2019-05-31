class User < ApplicationRecord
  has_many :projects
  has_many :tasks, through: :projects
  has_many :task_tags, through: :tasks
  has_many :tags, through: :task_tags

  validates :name, presence: true, allow_blank: false
  validates :name, uniqueness: true
  
end
