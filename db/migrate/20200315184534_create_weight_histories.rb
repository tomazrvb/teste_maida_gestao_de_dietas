class CreateWeightHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :weight_histories do |t|
      t.float :weight
      t.date :weighing_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
