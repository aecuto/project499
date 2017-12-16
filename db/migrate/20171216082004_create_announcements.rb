class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :des
      t.date :date

      t.timestamps
    end
  end
end
