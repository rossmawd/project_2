class Task < ApplicationRecord
  #validation to be added here
  #Has some methods in your models. These are to be used to better extract data from your tables.
  belongs_to :project
  #belongs_to :project #this may break it as the Task table has no project_id
  has_many :task_tags
  has_many :tags, through: :task_tags


  
end
