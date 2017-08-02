Rails.application.routes.draw do
  #root 'welcome#index'
  root 'welcome#new'
  post 'welcome/question_form' => 'welcome#question_form'
  # post 'welcome/index' => 'welcome#index'
  # post 'welcome/new' => 'welcome#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :welcome
                # Prefix Verb   URI Pattern                 Controller#Action
                # root GET    /                           welcome#new
                # welcome_index POST   /welcome/index(.:format)    welcome#index
                # welcome_new POST   /welcome/new(.:format)      welcome#new
                # GET    /welcome(.:format)          welcome#index
                # POST   /welcome(.:format)          welcome#create
                # new_welcome GET    /welcome/new(.:format)      welcome#new
                # edit_welcome GET    /welcome/:id/edit(.:format) welcome#edit
                # welcome GET    /welcome/:id(.:format)      welcome#show
                # PATCH  /welcome/:id(.:format)      welcome#update
                # PUT    /welcome/:id(.:format)      welcome#update
                # DELETE /welcome/:id(.:format)      welcome#destroy
end
