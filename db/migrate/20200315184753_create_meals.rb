class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.text :description
      t.time :schedule
      t.string :type
      t.references :diet, null: false, foreign_key: true
      t.timestamps
    end
  end
end
