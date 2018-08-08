class User < ApplicationRecord
	has_one :therapist

	has_secure_password


	
	enum role: [:user,:therapist,:admin]
end