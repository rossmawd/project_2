class ChangeArchiveTypeInProjects < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :archive, :boolean, :default => false
  end
end
