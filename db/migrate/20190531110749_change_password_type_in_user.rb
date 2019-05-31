class ChangePasswordTypeInUser < ActiveRecord::Migration[5.2]
  def change
    change_column(:users, :password, :string, default: "123")
    change_column(:users, :user_name, :string, default: "123")
  end
end
