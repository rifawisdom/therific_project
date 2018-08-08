class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id


      # @therapist = Therapist.find(current_user.therapist.id)
      # redirect_to therapist_path(@therapist)
      # byebug

      redirect_to users_path(current_user)
    else
    # If user's login doesn't work, send them back to the login form.
      flash[:danger] = "Opps! There is something wrong.Please try again"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
