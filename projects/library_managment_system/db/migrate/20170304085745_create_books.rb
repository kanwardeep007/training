class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|

      t.string :name
      t.float :price
      t.string :author_name
      t.string :subject 

      t.timestamps
    end
  end
end
