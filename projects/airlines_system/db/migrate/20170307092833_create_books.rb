class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.belongs_to :author, index: true

      t.timestamps
    end
  end
end
