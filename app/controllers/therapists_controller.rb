class TherapistsController < ApplicationController
	def index
		
		@therapist = Therapist.all
	end
	
	def search
		 @user = User.where("users.role = 1 and users.name ILIKE '%#{params['check_name']}%'")

		 respond_to do |format|
		 	format.html
		 	format.json{render json: @user}
		 end	
	end

	def search_thing
		@user = User.where("users.role = 1 and users.name ILIKE '%#{params['search']}%'")
		render json: @user
	end

	
	def show
		
	 @therapist = Therapist.find(params[:id])
	 @review = Review.where(therapist_id:@therapist.id)

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
