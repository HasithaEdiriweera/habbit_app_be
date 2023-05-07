class CreateHabbits < ActiveRecord::Migration[6.1]
  def change
    create_table :habbits do |t|
      t.string :name, null: false
      t.boolean :is_completed, default: false, null: false

      t.timestamps
    end
  end
end
