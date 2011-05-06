class AddAccountToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :account, :string
  end

  def self.down
    remove_column :users, :account
  end
end

