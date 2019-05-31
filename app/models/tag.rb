class Tag < ApplicationRecord
  has_many :task_tags
  has_many :tasks, through: :task_tags
  has_many :projects, through: :tasks

  validates :name, presence: true, allow_blank: false
  validates :name, uniqueness: true
   

end
