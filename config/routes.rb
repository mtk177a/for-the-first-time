Rails.application.routes.draw do
  get "public_records/index"
  # ルートパス
  root "static_pages#home"

  # ユーザー登録
  get "signup", to: "users#new", as: "signup"
  post "users", to: "users#create"

  # ログイン・ログアウト
  get "login", to: "user_sessions#new", as: "login"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy", as: "logout"

  resources :records, only: [ :index, :new, :create, :edit, :update, :destroy ]

  # アプリケーションのヘルスチェック
  get "up", to: "rails/health#show", as: :rails_health_check

  # PWA関連のルート
  get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest
end
