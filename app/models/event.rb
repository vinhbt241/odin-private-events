class Event < ApplicationRecord
  has_many :attended_events
  has_many :guests, through: :attended_events, source: :user

  belongs_to :creator, class_name: "User"
end
