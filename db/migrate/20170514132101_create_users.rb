class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :language, null: false
      t.string :other_language, null: false

      t.timestamps
    end
  end
end
