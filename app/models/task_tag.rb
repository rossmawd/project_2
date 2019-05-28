class TaskTag < ApplicationRecord
  belongs_to :tag
  belongs_to :task

  validates :tag, uniqueness: { scope: :task }
end
