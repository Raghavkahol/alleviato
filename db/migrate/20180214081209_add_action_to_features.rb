class AddActionToFeatures < ActiveRecord::Migration[5.1]
  def change
    add_column :features , :action , :string
  end
end
