class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :status
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
