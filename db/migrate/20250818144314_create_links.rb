class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :url, null: false
      t.text :description
      t.integer :position, null: false
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    add_index :links, [:user_id, :position], unique: true
    add_index :links, :active
  end
end
