class AddLikesCountToRecords < ActiveRecord::Migration[7.2]
  def change
    add_column :records, :likes_count, :integer
  end
end
