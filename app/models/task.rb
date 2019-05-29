class Task < ApplicationRecord
  #validation to be added here
  #Has some methods in your models. These are to be used to better extract data from your tables.
  belongs_to :project
  #belongs_to :project #this may break it as the Task table has no project_id
  has_many :task_tags
  has_many :tags, through: :task_tags
  
  validates :name, presence: true, allow_blank: false
  validates :name, uniqueness: {scope: :project,
    message: ": this project already has a task with that name!" }


   def create_task_tags(tag_ids)
    tag_ids.each do |id|
      TaskTag.create(tag_id: id, task_id: self.id)
    end
  end


    def update_task_tags(tag_ids)
      # iterate over self.task_tags
      # destroy each one
      self.task_tags.each do |tt|
        puts tt
        tt.destroy
      end

      tag_ids.each do |id|
          # create new task_tag
          TaskTag.create(tag_id: id, task_id: self.id )
      end    
    
    end

end
