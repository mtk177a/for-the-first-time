class CreateRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :records do |t|
      t.string :title
      t.text :memo
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
