Collector::Application.routes.draw do
  resources :assets do
    resources :options
  end

  root :to => 'assets#index'

end
