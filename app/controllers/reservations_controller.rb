class ReservationsController < ApplicationController
	def new
		@therapist = Therapist.find(params[:therapist_id])
	end
	
	def create
			
		@therapist = Therapist.find(params[:therapist_id])
		@reservation = Reservation.new(reservation_params)
		@reservation.therapist_id = @therapist.id
		@reservation.user_id = current_user.id
		
	  	if @reservation.category == "3 days session"
			@reservation.end_date = @reservation.start_date + 2.days

		elsif @reservation.category == "7 days session"
			@reservation.end_date = @reservation.start_date + 6.days
		
		else @reservation.category == "14 days session"
			@reservation.end_date = @reservation.start_date + 13.days
		end


		# respond_to do |format|
		if @reservation.save
			flash[:success] = "Successfully reserved your session with therapist!"
			redirect_to reservation_path(@reservation)
		else

			flash[:danger] = "#{@reservation.errors.full_messages}"
			redirect_back(fallback_location: new_therapist_reservation_path)
		end

	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	private
	def reservation_params
    	# strong params
  		params.require(:reservation).permit(:start_date, :end_date, :special_request, :total_price, :category, :user_id, :therapist_id)
	end

end
