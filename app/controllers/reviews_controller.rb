class ReviewsController < ApplicationController
	def new
		@reservation = Reservation.find(params[:reservation_id])
	end

	def create
		@reservation = Reservation.find(params[:reservation_id])
		@review = Review.new(review_params)

		@review.reviewed_by = current_user.id
		@review.reservation_id = params[:reservation_id]
		@review.therapist_id = @reservation.therapist_id

		if @review.save 
			
			flash[:success] = "Thank you for your rating and review!"
			redirect_to root_path
		else 
			redirect_back(fallback_location: new_reservation_review_path(@reservation))
		end
	end


	private
	def review_params
		params.require(:review).permit(:comment,:star)
	end
end
