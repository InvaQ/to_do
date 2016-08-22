require 'rails_helper'
require "shoulda/matchers"

RSpec.describe Task, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"
    it { should belong_to(:list) }

    subject { FactoryGirl.create(:task) }
    it { should validate_presence_of(:content) }
    it { should ensure_length_of(:content).is_at_most(60) }
    
end
