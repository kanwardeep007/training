class CreateAircrafts < ActiveRecord::Migration[5.0]
  def change
    create_table :aircrafts do |t|
    	t.string :aname
    	t.integer :cruising_range

      t.timestamps
    end
  end
end
