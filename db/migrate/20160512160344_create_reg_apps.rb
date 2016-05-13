class CreateRegApps < ActiveRecord::Migration

  def change
    create_table :reg_apps do |t|
      t.string :name
      t.string :url
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :reg_apps, :user_id
  end
end
