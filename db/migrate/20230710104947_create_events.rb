class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events, id: :uuid do |t|
      t.string :name, null: false
      t.string :description
      t.string :location
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :all_day, default: true
      t.string :color
      t.string :status, default: "confirmed"
      t.text :recurrence
      t.string :repeat, default: "never"
      t.datetime :repeat_until_date
      t.jsonb :repeat_except_dates, default: []
      t.integer :repeat_count
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
