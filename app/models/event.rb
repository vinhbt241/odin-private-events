class Event < ApplicationRecord
  has_many :attended_events
  has_many :attendees, through: :attended_events, source: :user, dependent: :destroy

  belongs_to :creator, class_name: "User"

  validates :name, presence: true
  validates :info, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
