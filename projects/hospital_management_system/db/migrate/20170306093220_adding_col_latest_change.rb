class AddingColLatestChange < ActiveRecord::Migration[5.0]
  def up
  	add_column :medicines, :manufacturing_date, :date
  end
  def down
  	remove_column :medicines,:manufacturing_date

  end
end
