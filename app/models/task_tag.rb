class TaskTag < ApplicationRecord
  belongs_to :tag
  belongs_to :task

  validates :tag, uniqueness: { scope: :task } # the tag of this task tag can only occur once in this tag
  validates :tag_id, presence: true
  validates :task_id, presence: true
  validates :tag_id, numericality: { only_integer: true }# only allows integers
  


  # must exist
end
