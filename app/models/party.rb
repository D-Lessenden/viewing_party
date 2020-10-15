class Party < ApplicationRecord
  validates :date, :start_time, presence: true
  validates :duration, numericality: { only_integer: true }
  belongs_to :user
end
