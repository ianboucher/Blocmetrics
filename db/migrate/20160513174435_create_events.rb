class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :category
      t.string :action
      t.string :label
      t.integer :value
      # t.jsonb :data, null: false, default: '{}'
      t.integer :reg_app_id

      t.timestamps null: false
    end
    add_index :events, :reg_app_id#, :data, using: :gin
  end
end
