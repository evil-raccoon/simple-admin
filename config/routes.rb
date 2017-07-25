require 'simple_admin/dynamic_actions'
require 'simple_admin/dynamic_controllers'

Rails.application.routes.draw do
  namespace :admin do
    root 'dashboard#index'

    scope "/:locale", locale: 'en|ru' do
      get 'dashboard' => 'dashboard#index'

      namespace :system do
        resources :settings, only: [:index, :update]
        resources :languages, except: :show
        resources :entities,  except: :show
        resources :entity_field_types, except: :show
      end

      resources :entity_fields, only: [:create, :update, :destroy]

      if ActiveRecord::Base.connection.table_exists?('simple_admin_entities')
        SimpleAdmin::Entity.collection_names.each do |model_name, collection_name|
          resources collection_name

          dynamic_controller = SimpleAdmin::DynamicControllers.new(collection_name)
          dynamic_controller.set!

          SimpleAdmin::DynamicActions.set!(dynamic_controller.get_klass_name, model_name, collection_name)
        end
      end

    end
  end
end
