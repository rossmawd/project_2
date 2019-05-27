class Project < ApplicationRecord
  has_many :tasks
  has_many :task_tags, through: :task
  has_many :tags, through: :task_tags
end
