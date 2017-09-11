class CreateMedicines < ActiveRecord::Migration[5.0]
  def change
    create_table :medicines do |t|
    	t.string :name
    	t.float :price
    	t.string :man_company
    	t.date :exp_date

      t.timestamps
    end
  end
end
