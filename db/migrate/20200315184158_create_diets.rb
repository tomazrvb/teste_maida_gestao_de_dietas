class CreateDiets < ActiveRecord::Migration[6.0]
  def change
    create_table :diets do |t|
      t.date :start_date
      t.date :end_date
      t.float :starting_weight
      t.float :ideal_weight
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
