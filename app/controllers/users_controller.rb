class UsersController < ApplicationController
	def new
    end

    def show
    	@user = User.find(params[:id])
    end

    def create
	    user = User.new(user_params)
	if user.role == "user"
	  if user.save
	    session[:user_id] = user.id
	    redirect_to '/'
	  else
	    redirect_to '/signup'
	  	flash[:danger] = "Opps! There is something wrong.Please try again"
	  end
	else
	  if user.save

	    session[:user_id] = user.id
		redirect_to '/'
	  else
	    redirect_to '/signup'
	  	flash[:danger] = "Opps! There is something wrong.Please try again"
	  end
	end
    end  

    def update
    	@user= User.find(params[:id])
    	if @user.id != current_user.id
			flash[:danger] = "You're not permitted to update other person profile!"
			redirect_back fallback_location: users_path
		else
			if @user.update(user_params)
				redirect_to users_path
			else
				render 'update'
			end

		end
    end 

    def edit
    	@user = User.find(params[:id])
    end



	private
	def user_params
	  params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :gender, :phone, :role)
	end
	
end
