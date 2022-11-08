class CreateTheaterComments < ActiveRecord::Migration[6.1]
  def change
    create_table :theater_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :theater_id

      t.timestamps
    end
  end
end
