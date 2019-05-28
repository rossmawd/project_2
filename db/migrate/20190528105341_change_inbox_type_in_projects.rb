class ChangeInboxTypeInProjects < ActiveRecord::Migration[5.2]
  def change
      change_column :projects, :inbox, :boolean, :default => false
  end
end
