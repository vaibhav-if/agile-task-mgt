module ControllerMacros
    def login_user
      # Before each test, create and login the user
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        user = User.create!(email: "abc@abc.com", password: "123456")
        sign_in user
      end
    end

    def register_user
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        reg_user = User.create!(email: "abcd@abcd.com", password: "123456")
        sign_up reg_user
      end
    end
  
    # Not used in this tutorial, but left to show an example of different user types
    # def login_admin
    #   before(:each) do
    #     @request.env["devise.mapping"] = Devise.mappings[:admin]
    #     sign_in FactoryBot.create(:admin) # Using factory bot as an example
    #   end
    # end
  end