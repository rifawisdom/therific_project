class User < ApplicationRecord
	has_one :therapist
	has_many :reservations
	has_many :therapists,through: :reservations

	has_secure_password


	
	enum role: [:user,:therapist,:admin]

	scope :check_name, ->(search_name){ where("name ILIKE ?", "%#{search_name}%")}
end