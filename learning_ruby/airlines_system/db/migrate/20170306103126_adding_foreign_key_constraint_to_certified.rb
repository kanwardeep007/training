class AddingForeignKeyConstraintToCertified < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :certifieds, :employees
    add_foreign_key :certifieds, :aircrafts
  end
end
