class AddUserNameToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :user_name, :string
  end
end
