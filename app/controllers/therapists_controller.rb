class TherapistsController < ApplicationController
	def index
		@user = User.all
		@therapist = Therapist.all
	end
	
	def show
		
		
	 @user = User.find(params[:id])
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
  def therapist_params
    params.require(:therapist).permit(:address, :coins, user_id: :current_user.id)
  end
end
