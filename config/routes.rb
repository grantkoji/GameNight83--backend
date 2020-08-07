Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users
      get '/users/stay_logged_in', to: 'users#stay_logged_in'
      post '/users/login', to: 'users#login'
    end
  end
  namespace :api do
    namespace :v1 do
      resources :friendships
    end
  end
  namespace :api do
    namespace :v1 do
      resources :games
    end
  end
  namespace :api do
    namespace :v1 do
      resources :game_photos
    end
  end

  namespace :api do
    namespace :v1 do
      resources :played_games
    end
  end

  namespace :api do
    namespace :v1 do
      resources :reviews
    end
  end

end
