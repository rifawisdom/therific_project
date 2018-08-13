class Review < ApplicationRecord
	belongs_to :therapist
	belongs_to :reservation

	validates :comment, presence: true
  	validates :star, presence: true
end
