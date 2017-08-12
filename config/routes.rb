Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :monthlies, only: [:index, :create, :show, :update]
      resources :dailies, only: [:index, :create, :show, :update]
      resources :hourlies, only: [:index, :create, :show, :update]
      resources :stations, only: [:index, :create, :show, :update]

      get '/monthlies/:wban', to: 'stations#show'
      get '/dailies/:wban', to: 'stations#show'
      get '/hourlies/:wban', to: 'stations#show'
      get '/stations/:wban', to: 'stations#show'

      # get	'/hourlies/:wban/:year_month_day', to: 'hourlies#entry'
      get	'/dailies/:wban/:year_month_day', to: 'dailies#entry'
      get	'/monthlies/:wban/:year_month', to: 'monthlies#entry'

      # get	'/hourlies/:wban/:year_month_day', to: 'hourlies#entry'
      get	'/dailies/:wban/:year_month_day/adjacent', to: 'dailies#entry_adjacent'
      get	'/dailies/:wban/:year_month_day/yeartoyear', to: 'dailies#entry_yeartoyear'
      get	'/dailies/:wban/:year_month_day/historical', to: 'dailies#entry_historical'

      get	'/monthlies/:wban/:year_month/adjacent', to: 'monthlies#entry_adjacent'
      get	'/monthlies/:wban/:year_month/yeartoyear', to: 'monthlies#entry_yeartoyear'
      get	'/monthlies/:wban/:year_month/historical', to: 'monthlies#entry_historical'

    end
  end

end
