Rails.application.routes.draw do
  devise_for :users, path: "admin"

  root "pages#home"
  get "pages/contact_us", as: "contactUs"
  get "pages/products", as: "products"
  get "pages/service", as: "service"
  get "pages/about", as: "about"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
