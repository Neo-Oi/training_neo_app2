Rails.application.routes.draw do
    resources :users
    root "logins#index"
    get "homes", to: "homes#index"

    get "fails", to: "fails#index"

    get "logins", to: "logins#index"
    post "logins", to: "logins#create"

    post "/reset_login_fails", to: "fails#reset_login_fails"

    delete "/logout", to: "logins#destroy", as: :logout
end
