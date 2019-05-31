class Task < ApplicationRecord

  belongs_to :project
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

  def destroy_task_tags
    self.task_tags.each do |tt|
      puts "#{tt}" + " ####  DESTROYED!   #####"
      tt.destroy
    end
  end

  def update_task_tags(tag_ids)
    # iterate over self.task_tags
    # destroy each one
    self.destroy_task_tags

    tag_ids.each do |id|
        # create new task_tag
        TaskTag.create(tag_id: id, task_id: self.id )
    end    
  
  end

end
