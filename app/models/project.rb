class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :task_tags, through: :tasks
  has_many :tags, through: :task_tags

  validates :name, presence: true

  def self.sorted(sort_method)
   
    case sort_method 
      when "by_outstanding"
        self.all.sort_by{ |project| project.incomplete_tasks_count}.reverse
        # SOrting 7 million things! THIS SORTING should be done by AR queries!!
      when "by_user"
        self.all.sort_by{|project| project.user.name}
    end

  end

  def task_count
    self.tasks.length
  end

  def incomplete_tasks
    to_do = self.tasks.select do |task| 
      task.complete == false
    end
  end

  def incomplete_tasks_count
    incomplete_tasks.length
  end


end
