class AdminsController < ApplicationController
	def index
		@therapist = Therapist.all
		@review = Review.all
	end

	def destroy_therapist

		@therapist = Therapist.find(params[:id])
		@therapist.delete

		redirect_to admins_path
	end

	def destroy_review
		@review = Review.find(params[:id])
		@review.delete

		redirect_to admins_path
	end
end
