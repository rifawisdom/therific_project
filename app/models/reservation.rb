class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :therapist
  has_many :therapists,through: :reviews

  validates :start_date, presence: true
  validates :category, presence: true
  validate :overlapping_reservations


	# Check if a given reservation overlaps this interval
	def overlapping_reservations
		# =? prevents sql injection
		reservations = Reservation.where("therapist_id =?", self.therapist_id)

		if reservations.count > 0
			reservations.each do |r|
				if overlaps?(r)
					return errors.add(:unavailable, "dates! Someone has already book session with this therapist")
				elsif backdates?
					return errors.add(:error, "dates! Cannot be lesser than today")

				end
			end
		end
	end

	def backdates?

		start_date < Date.today
	end

	

	private	
	# Check if a given reservation overlaps this reservation    
	def overlaps?(other)
		self.start_date <= other.end_date && other.start_date <= self.end_date
	end

end



