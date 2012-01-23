Collector::Application.routes.draw do
  resources :options

  resources :assets

  root :to => 'assets#index'

end
