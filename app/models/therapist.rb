class Therapist < ApplicationRecord
	belongs_to :user
	has_many :reservations,:dependent => :destroy
	has_many :users,through: :reservations


	scope :check_name, ->(search_name){ where("name ILIKE ?", "%#{search_name}%")}
end

