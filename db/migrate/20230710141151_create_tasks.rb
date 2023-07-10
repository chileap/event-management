class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :all_day, default: true
      t.datetime :due_at
      t.datetime :end_at
      t.text :recurrence
      t.string :repeat, default: "never"
      t.datetime :repeat_until_date
      t.jsonb :repeat_except_dates, default: []
      t.integer :repeat_count
      t.string :status, null: false, default: "pending"
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
