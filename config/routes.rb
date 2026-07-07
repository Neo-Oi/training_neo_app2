Rails.application.routes.draw do
 resources :users
 get 'homes',to: 'homes#index'
 get 'fails',to: 'fails#index'
 get 'logins',to: 'logins#index'
 get 'logins/new',to: 'logins#new'
 post 'logins',to: 'logins#create'
 post "/reset_login_fails", to: "fails#reset_login_fails"
 delete "/logout", to: "logins#destroy", as: :logout
 root "logins#index"
end
