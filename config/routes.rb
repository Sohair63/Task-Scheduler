TaskScheduler::Application.routes.draw do
  root to: 'tasks#index'

  resources :tasks

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :schedular, only: [] do
        collection do
          get :tasks
        end
      end
    end
  end

end
