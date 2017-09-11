class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :name
      t.timestamps
    end
    execute "SELECT setval('questions_id_seq', 1000);"
  end
end
