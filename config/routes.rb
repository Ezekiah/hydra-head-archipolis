
HydraHead::Application.routes.draw do
  
  
  #resources :descriptions

  #resources :contributors

  #esources :orgunits

  #resources :people

  #mount HydraEditor::Engine => '/hydra-editor/'
  
  #resources :documents

  

  #get "create_study/index"
  #get "create_study/show"  
  
  
  root :to => "site#index"
  
  
  
  HydraHead.add_routes(self)
  
  
  
  
  namespace :api do
    
    resources :studies

    resources :collections  do
      get '/xml_form/' => 'collections#xml_form', :as => :xml_form
      get '/html_form/' => 'collections#html_form', :as => :html_form
      get 'get_collection_json'=>'collections#get_collection_json', :as => :get_collection_json
    end
    
    resources :ressources do
      get '/xml_form/' => 'ressources#xml_form', :as => :xml_form
      get '/html_form/' => 'ressources#html_form', :as => :html_form
    end

  end
  
  
  

  scope "/:locale", locale: /en|fr/ do
    
    get "site/index"
    
    resources :studies
    
    devise_for :users
    
    resources :study_steps do
    	
        get :contributor
        get :method
        post :corpus
        get :universe
        get :analyse
        get :edition
        get :notes
        get :general
    end
    
    Blacklight.add_routes(self)
    
    get 'advanced' => 'advanced#index'
    

  #root :to => "controller#action"
    
    #root to: redirect("%{locale}/home", status: 302)
  end

  #root to: redirect("#{I18n.default_locale}", status: 302), as: :redirected_root

  get "/*path", to: redirect("#{I18n.default_locale}/%{path}", status: 302), constraints: {path: /(?!(#{I18n.available_locales.join("|")})\/).*/}, format: false

  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
