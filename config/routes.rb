Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do
      get '/users', to: 'users#index'
      post '/users', to: 'users#create'
      get '/users/stay_logged_in', to: 'users#stay_logged_in'
      post '/user/login', to: 'users#login'
      get '/users/:id', to: 'users#show'
      put '/users/:id', to: 'users#update'
      delete '/users/:id', to: 'users#destroy' 
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

  namespace :api do
    namespace :v1 do
      resources :friendship_requests
    end
  end

end
