require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do 
    let(:user) { User.new } 

    it 'ensures username presence' do 
      user.email = nil
      expect(user.save).to eq(false)
    end

    it 'should save successfully' do
      user.email = "abcd@abcd.com"
      user.password = 123456
      expect(user.save).to eq(true)
    end
  end
end
