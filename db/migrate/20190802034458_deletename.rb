class Deletename < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name ,:string
    remove_column :posts, :name ,:string
  end
end
