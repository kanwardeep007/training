class CreateAttendees < ActiveRecord::Migration[5.1]
  def change
    create_table :attendees do |t|
      t.string :username
      t.datetime :entry_time
      t.datetime :exit_time
      t.timestamps
    end
  end
end
