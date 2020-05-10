Rails.application.routes.draw do
 resources :books
 root 'homes#top'
 delete 'books/:id' => 'books#destroy', as: 'destroy_books'
end
