Rails.application.routes.draw do
  scope :v1 do
    resources :books, except: [:new, :edit] do
      delete :unpublish, on: :member
    end
  end
end
