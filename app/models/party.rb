class Party < ApplicationRecord

  validates :movie_title, :date, :start_time, presence: true
  validates_numericality_of :duration, presence: true

  belongs_to :user, class_name: 'User'
end
