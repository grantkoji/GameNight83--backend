Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users
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
