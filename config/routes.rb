Rails.application.routes.draw do
  root to: "libraries#index"

  resources :users
  resources :libraries do
    member do
      get :info
    end

    resources :assets do
      resources :comments

      collection do
        get :delete
        delete :delete
      end
    end
  end

  post '/save-search', to: "libraries#save", as: 'save'
  delete '/save-search', to: "libraries#delete_save", as: 'save_delete'
end
