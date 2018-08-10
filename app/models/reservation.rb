class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :therapist

  validate :overlapping_reservations


	# Check if a given reservation overlaps this interval
	def overlapping_reservations
		# =? prevents sql injection
		reservations = Reservation.where("therapist_id =?", self.therapist_id)

		if reservations.count > 0
			reservations.each do |r|
				if overlaps?(r)
					return errors.add(:unavailable, "dates! Someone has already book session with this therapist")
				end
			end
		end
	end

	

	private	
	# Check if a given reservation overlaps this reservation    
	def overlaps?(other)
		self.start_date <= other.end_date && other.start_date <= self.end_date
	end

end



