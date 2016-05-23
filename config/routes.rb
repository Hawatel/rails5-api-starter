Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  get '/', to: 'public#index', :defaults => { :format => 'json' }

  resources :todos, :defaults => { :format => 'json' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
