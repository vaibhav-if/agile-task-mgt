require 'rails_helper'
require 'spec_helper'

RSpec.describe "Projects", type: :request do

  describe "GET /projects" do
    it 'returns a success response' do 
      login_and_logout_with_warden do
        get projects_path
        expect(response).to be_successful
      end
    end
  end
end
