class Signup < ApplicationRecord
  belongs_to :camper
  belongs_to :activity

  validates :time, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 23}
  # validates :activity_id, uniqueness: { scope: :camper_id, message: 'can only signup for activity once'}
end