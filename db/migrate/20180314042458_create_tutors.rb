class CreateTutors < ActiveRecord::Migration[5.1]
  def change
    create_table :tutors do |t|
        t.integer :user_id
        t.string :user_name
        t.string :user_email
        t.string :subject
        t.string :timing
      t.timestamps
    end
  end
end
