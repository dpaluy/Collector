Collector::Application.routes.draw do

  resources :volatilities do
    resources :vol_values
  end

  resources :assets do
    resources :options do
      resources :option_values
    end
    resources :values
  end

  root :to => 'assets#index'

end
