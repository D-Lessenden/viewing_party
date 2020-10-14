class Party < ApplicationRecord
  validates :movie_title, :date, :start_time, presence: true
  validates :duration, numericality: { only_integer: true }
  belongs_to :user, class_name: 'User'
end
