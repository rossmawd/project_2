class ChangeArchiveTypeInTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :archive, :boolean, :default => false
  end
end
