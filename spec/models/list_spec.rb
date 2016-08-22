require 'rails_helper'

RSpec.describe List, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it { should have_many(:tasks).dependent(:destroy) }
  it { should belong_to(:user) }

  subject { FactoryGirl.create(:list) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:descriotion) }
    

end
