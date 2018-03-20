class AddPriceToTutors < ActiveRecord::Migration[5.1]
  def change
      add_column :tutors, :price, :integer
  end
end
