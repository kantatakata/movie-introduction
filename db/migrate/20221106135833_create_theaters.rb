class CreateTheaters < ActiveRecord::Migration[6.1]
  def change
    create_table :theaters do |t|
      t.string :title, null: false
      t.text :introduction, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
