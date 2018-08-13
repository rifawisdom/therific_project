require 'rails_helper'
require 'byebug'
require 'spec_helper'

RSpec.describe User, :type => :model do
  

	it "must have password" do
        user = User.new(name: "Bob", email:"bob@email.com")
        expect(user).to_not be_valid
    end

    it "should have password" do
        user = User.new(name: "Bob", password:"uiop7890", email:"bob@email.com")
        expect(user).to be_valid
    end

    it "must have password_confirmation" do
        user = User.new(name: "Bob", password: 'short', password_confirmation: 'long', email:"bob@email.com")
        expect(user).to_not be_valid
    end

    it "should have password_confirmation" do
        user = User.new(name: "Bob", password: 'short', password_confirmation: 'short', email:"bob@email.com")
        expect(user).to be_valid
    end

    it "is not valid with same username" do
        user1 = User.create(name: "Bob", password:"uiop7890", email:"bob1@email.com")
        user2 = User.new(name: "Bob", password:"uiop7890", email:"bob2@email.com")
        expect(user2).to_not be_valid
    end

    it "is valid only with unique username" do
        user1 = User.create(name: "Bob1", password:"uiop7890", email:"bob1@email.com")
        user2 = User.new(name: "Bob2", password:"uiop7890", email:"bob2@email.com")
        expect(user2).to be_valid
    end

    it "is not valid only with same email" do
        user1 = User.create(name: "Bob1", password:"uiop7890", email:"bob@email.com")
        user2 = User.new(name: "Bob2", password:"uiop7890", email:"bob@email.com")
        expect(user2).to_not be_valid
    end

    it "is valid only with unique email" do
        user1 = User.create(name: "Bob1", password:"uiop7890", email:"bob1@email.com")
        user2 = User.new(name: "Bob2", password:"uiop7890", email:"bob2@email.com")
        expect(user2).to be_valid
    end

    it "should have a username" do
        user = User.new(password:"uiop7890", email:"bob1@email.com")
        expect(user).to_not be_valid
    end

    it "should have a username" do
        user = User.new(name: "Bob1", password:"uiop7890", email:"bob1@email.com")
        expect(user).to be_valid
    end

    it "should have a email" do
        user = User.new(name: "Bob1", password:"uiop7890")
        expect(user).to_not be_valid
    end

    it "should have a email" do
        user = User.new(name: "Bob1", password:"uiop7890", email:"bob1@email.com")
        expect(user).to be_valid
    end

    it "should not belongs to therapists" do 
        #            this tests for association, which will return information about the given association
        user1 = User.reflect_on_association(:therapists)
        #            set expectations on the result of the .macro method
        expect(user1.macro).to_not eq(:belongs_to)
    end

    it "should have many therapist" do 
        user1 = User.reflect_on_association(:therapists)
        expect(user1.macro).to eq(:has_many)
    end

    it "should have dependent: :destroy" do
        user1 = User.create(name: "Bob1", password:"uiop7890", email:"bob1@email.com")
        therapist1 = Therapist.create(location: "ABC", user: user1)
        expect { user1.destroy }.to change { Therapist.count }.by(-1)
    end


 
# Capybara
feature 'Visitor Login' do
	  scenario 'with valid email and password' do
	    signup_path 'valid@example.com', 'password'

	    expect(page).to have_content('/users/current_user.id')
	  end

	  scenario 'with invalid email' do
	    signup_path '', 'password'

	    expect(page).to have_content('/')
	  end

	  scenario 'with blank password' do
	    signup_path 'valid@example.com', ''

	    expect(page).to have_content('/')
	  end

	  def login_with(email, password)
	    visit login_path
	    fill_in 'Email', with: email
	    fill_in 'Password', with: password
	    click_button 'Submit'
	  end
end
end
