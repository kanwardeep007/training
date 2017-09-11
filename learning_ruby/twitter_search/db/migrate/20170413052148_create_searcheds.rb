class CreateSearcheds < ActiveRecord::Migration[5.0]
  def change
    create_table :searcheds do |t|
      t.string :field

      t.timestamps
    end
  end
end
