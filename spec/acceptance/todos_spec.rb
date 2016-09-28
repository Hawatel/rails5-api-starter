require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'factory_girl'


RspecApiDocumentation.configure do |config|
  config.format = [:json, :combined_text, :html]
  config.curl_host = 'http://localhost:3000'
  config.api_name = "Example App API"
end

resource "TODO" do

  before do
    # create fake element in TODOs list
    Todo.create(:title => 'This is Fake data which is put to TO', )
  end

  before (:each) do
    # create fake user
    user = FactoryGirl.build(:user)
    set_header(user.create_new_auth_token)
  end

  # GET /todos
  get "/todos.json" do
    parameter :parameter1, "The thing you want to greet"
    parameter :parameter2, "The thing you want to greet"

    it "Name showed on index page" do
      explanation "This is example comment which is added to documentation"
      do_request
      expect(response_headers["Content-Type"]).to eq("application/json; charset=utf-8")
      expect(status).to eq(200)
      expect(response_body).to include('success')
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