Rails.application.routes.draw do
  devise_for :users
  scope "(:locale)", locale: /en|uk|ru/ do
  resources :projects do
    resources :tasks, shallow: true do
      member do
        patch :complete
      end
    end
  end
end
  get '/:locale' => 'projects#index'
  root 'projects#index'
end
