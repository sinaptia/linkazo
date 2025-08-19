class AddProfileFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :bio, :text
    add_column :users, :username, :string, null: false
    add_column :users, :display_name, :string, null: false
    add_column :users, :theme_primary_color, :string
    add_column :users, :theme_secondary_color, :string
    add_column :users, :theme_font_family, :string

    add_index :users, :username, unique: true
  end
end
