class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :task_tags, through: :tasks
  has_many :tags, through: :task_tags

  validates :name, presence: true
end
