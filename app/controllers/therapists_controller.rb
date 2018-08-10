class TherapistsController < ApplicationController
	def index
		
		@therapist = Therapist.all
	end
	
	def search

		# below is ajax kind of search and work for both
		 @therapist = Therapist.all
		 filter_params(params).each do |key, value|
		 	@therapist = @therapist.public_send(key,value) if value.present?
		 end

		 respond_to do |format|
		 	format.html
		 	format.json{render json: @therapist}
		 end


	end

	
	def show
		
		
	 @therapist = Therapist.find(params[:id])
	end
		
	
	def new
		@therapist = Therapist.new
	end

	def create
	# 	@therapist = Therapist.new(params[:therapist])

	# 	@therapist.save
	# 	redirect_to @therapist
	end

	def update

	end

	def delete
		
	end

  private

  def filter_params(params)
	params.slice(:check_name)
  end

  def therapist_params
    params.require(:therapist).permit(:address, :coins, user_id: :current_user.id)
  end
end
