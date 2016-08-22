require 'rails_helper'

RSpec.describe User, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"
  
  
    it { should have_many(:lists) }
  
    subject { FactoryGirl.create(:user) }

    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:lists) }
    
    it { should be_valid }
  
  

end
