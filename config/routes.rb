Collector::Application.routes.draw do

  resources :assets do
    resources :options
    resources :values
  end

  root :to => 'assets#index'

end
