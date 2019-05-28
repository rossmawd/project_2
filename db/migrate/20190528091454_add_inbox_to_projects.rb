class AddInboxToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :inbox, :boolean
  end
end
