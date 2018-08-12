class Review < ApplicationRecord
	belongs_to :therapist
	belongs_to :reservation
end
