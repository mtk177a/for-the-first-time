class Like < ApplicationRecord
  belongs_to :user
  belongs_to :record, counter_cache: true

  validates :user_id, uniqueness: { scope: :record_id }
end
