class Therapist < ApplicationRecord
	belongs_to :user
	has_many :reservations,:dependent => :destroy
	has_many :users,through: :reservations
end
