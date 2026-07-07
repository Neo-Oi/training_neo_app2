Rails.application.routes.draw do
 resources :users
 get 'logins',to: 'logins#index'
 root "logins#index"
end
