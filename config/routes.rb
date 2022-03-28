Rails.application.routes.draw do
  scope :v1 do
    post :auth, to: "authentication#create"

    resources :books, except: [:new, :edit] do
      delete :unpublish, on: :member
    end
  end
end
