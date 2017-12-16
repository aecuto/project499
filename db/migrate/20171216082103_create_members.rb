class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :member_id
      t.date :start_date
      t.date :end_date
      t.integer :freeze_count, null: false, default: 0

      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
