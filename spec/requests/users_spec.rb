require 'rails_helper'
require 'spec_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it 'returns a success response' do 
      get user_session_path
      expect(response).to be_successful
    end
  end
end
