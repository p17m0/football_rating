class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.date :date, null: false
      t.float :weight, null: false, default: 1.0

      t.timestamps
    end
  end
end
