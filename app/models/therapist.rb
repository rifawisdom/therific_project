	class Therapist < ApplicationRecord
	belongs_to :user
	has_many :reservations,:dependent => :destroy
	has_many :users,through: :reservations
	# has_many :reservations,through: :reviews


	scope :check_name, ->(search_name){ where("name ILIKE ?", "%#{search_name}%")}
end

