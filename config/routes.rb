Rails.application.routes.draw do
  ## For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount_devise_token_auth_for 'User', at: 'auth'

  get  '/', to: 'public#index',  :defaults => { :format => 'json' }
  post '/', to: 'public#create', :defaults => { :format => 'json' }

  resources :todos, :defaults => { :format => 'json' }

  ## Secure access to sidekiq Web Interface by username and passwod
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV["SIDEKIQ_USERNAME"] && password == ENV["SIDEKIQ_PASSWORD"]
  end if Rails.env.production?
  mount Sidekiq::Web => '/sidekiq'

  #mount API::Base, at: "/"
  
  # namespace the controllers without affecting the URI
  mount API::Base, at: "/"
  
end
