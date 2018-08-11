require 'rails_helper'
require 'byebug'

RSpec.describe Reservation, :type => :model do
  

    it "should belongs to therapist" do 
        #            this tests for association, which will return information about the given association
        reservation1 = Reservation.reflect_on_association(:therapist)
        
        #            set expectations on the result of the .macro method
        expect(reservation1.macro).to eq(:belongs_to)
    end

    it "should belongs to user" do 
        #            this tests for association, which will return information about the given association
        reservation1 = Reservation.reflect_on_association(:user)
        #            set expectations on the result of the .macro method
        expect(reservation1.macro).to eq(:belongs_to)
    end

    it "should not has overlapped date" do 
        reservation1 = Reservation.create(start_date:"2018-09-01", end_date:"2018-09-07")
        reservation2 = Reservation.new(start_date:"2018-09-06", end_date:"2018-09-08")
        expect(reservation2).to_not be_valid
    end

 
end