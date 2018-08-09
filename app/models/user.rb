class User < ApplicationRecord
	has_one :therapist
	has_many :reservations
	has_many :therapists,through: :reservations

	has_secure_password


	
	enum role: [:user,:therapist,:admin]
end