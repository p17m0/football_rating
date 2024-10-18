class CreateStatistics < ActiveRecord::Migration[7.1]
  def change
    create_table :statistics do |t|
      t.references :player, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true

      t.integer :goals, null: false, default: 0
      t.integer :assists, null: false, default: 0
      t.integer :shots, null: false, default: 0
      t.integer :saves, null: false, default: 0
      t.integer :tackles, null: false, default: 0
      t.float :rating, null: false, default: 0.0

      t.timestamps
    end
  end
end
