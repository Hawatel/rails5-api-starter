require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'factory_girl'

RspecApiDocumentation.configure do |config|
  config.format = [:json, :combined_text, :html]
  config.curl_host = 'http://localhost:3000'
end

resource "Authentication" do

  before(:each) do
    @user = FactoryGirl.build(:user)
    @user.create_new_auth_token
  end

  post "/auth/sign_in" do
    parameter :email, 'Email address'
    parameter :password, 'Password for user'

    it "incorrect login and password" do
      do_request(:email => 'user@dontexistr.com', :password => 'wrong_password')
      expect(status).to eq(401)
      expect(response_body).to include('Invalid login credentials')
    end

    it "user dosn't confirm registration process" do
      do_request(:email => @user.email, :password => @user.password) # send post data
      expect(status).to eq(401)
      expect(response_body).to include('A confirmation email was sent to your account at')
    end

    it "correct login and password" do
      @user.skip_confirmation!
      @user.save!
      do_request(:email => @user.email, :password => @user.password)
      expect(status).to eq(200)
      expect(response_body).to include(@user.email)
    end
  end


  post "/auth/" do
    parameter :email, 'Email address'
    parameter :password, 'User password'
    parameter :password_confirmation, 'Confirmation password'
    parameter :confirm_success_url, 'Redirect URL'

    it "user already exist" do
      do_request(:email => @user.email, :password => @user.password, :password_confirmation => @user.password, :confirm_success_url => 'localhost:3000')
      expect(status).to eq(422)
      expect(response_body).to include('Email already in use')
    end

    it "create new user" do
      @user = FactoryGirl.build(:user)
      do_request(:email => @user.email, :password => @user.password, :password_confirmation => @user.password, :confirm_success_url => 'localhost:3000')
      expect(status).to eq(200)
      expect(response_body).to include(@user.email)
    end
  end


  delete '/auth/sign_out' do
    it "logout current logged user" do
      user = FactoryGirl.build(:user)
      set_header(user.create_new_auth_token)
      do_request
      expect(status).to eq(200)
    end
  end

end

# Before each call, set key value to header. Required by auth
def set_header(auth_headers)
  header 'access-token', auth_headers['access-token']
  header 'token-type', auth_headers['token-type']
  header 'client', auth_headers['client']
  header 'expiry', auth_headers['expiry']
  header 'uid', auth_headers['uid']
end