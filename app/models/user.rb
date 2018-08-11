class User < ApplicationRecord
	has_one :therapist, dependent: :destroy
	has_many :reservations
	has_many :therapists,through: :reservations

	has_secure_password
		
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

	
	enum role: [:user,:therapist,:admin]
	# scope :check_name, ->(search_name){ where("name ILIKE ?", "%#{search_name}%")}

	

end