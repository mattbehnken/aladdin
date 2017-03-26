class CreatePrefs < ActiveRecord::Migration
  def change
    create_table :prefs do |t|
      t.string :name
      t.string :value

      t.timestamps null: false
    end
  end
end
