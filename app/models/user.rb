class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :records, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_records, through: :likes, source: :record

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:password] }

  validates :name, presence: true
end
