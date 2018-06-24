require 'rails_helper'

RSpec.describe User, type: :model do
    # pending "add some examples to (or delete) #{__FILE__}
      
    before { @user = FactoryBot.build(:user) }
      
    subject { @user }
    
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:password) }
    it { should validate_confirmation_of(:password_confirmation) }
    it { should allow_value('example@domain.com').for(:email) }
      
    it { should be_valid }
    
    describe "when email is not present" do
        #before { @user = FactoryBot.build(:user) }
        before { @user.email = " " }
      
        it { should_not be_valid }
    end
end