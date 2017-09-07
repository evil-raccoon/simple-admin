require 'rails/generators/active_record'

module SimpleAdmin
  module Generators
    class MigrationGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      argument :name, default: 'simple_admin'

      def copy_simple_admin_migration
        migration_template 'migrations/devise_migration.rb', 'db/migrate/create_simple_admin_devise_migration.rb'
        migration_template 'migrations/core_migrations/profiles_migration.rb', 'db/migrate/create_simple_admin_profiles_migration.rb'

        # ACTS_AS_TAGGABLE
        migration_template 'migrations/acts_as_taggable_on/acts_as_taggable_on_migration.acts_as_taggable_on_engine.rb', 'db/migrate/acts_as_taggable_on_migration.acts_as_taggable_on_engine.rb'
        migration_template 'migrations/add_missing_unique_indices.acts_as_taggable_on_engine.rb', 'db/migrate/add_missing_unique_indices.acts_as_taggable_on_engine.rb'
        migration_template 'migrations/add_taggings_counter_cache_to_tags.acts_as_taggable_on_engine.rb', 'db/migrate/add_taggings_counter_cache_to_tags.acts_as_taggable_on_engine'
        migration_template 'migrations/add_missing_taggable_index.acts_as_taggable_on_engine.rb', 'db/migrate/add_missing_taggable_index.acts_as_taggable_on_engine.rb'
        migration_template 'migrations/change_collation_for_tag_names.acts_as_taggable_on_engine.rb', 'db/migrate/change_collation_for_tag_names.acts_as_taggable_on_engine.rb'
        migration_template 'migrations/add_missing_indexes_on_taggings.acts_as_taggable_on_engine.rb', 'db/migrate/add_missing_indexes_on_taggings.acts_as_taggable_on_engine.rb'

        migration_template 'migrations/rolify_migration.rb', 'db/migrate/create_simple_admin_rolify_migration.rb'

        migration_template 'migrations/core_migrations/entities_migration.rb', 'db/migrate/create_simple_admin_entities_migration.rb'

        migration_template 'migrations/core_migrations/entity_fields_migration.rb', 'db/migrate/create_simple_admin_entity_fields_migration.rb'
        migration_template 'migrations/core_migrations/entity_field_types_migration.rb', 'db/migrate/create_simple_admin_entity_field_types_migration.rb'
        migration_template 'migrations/core_migrations/entity_field_settings_migration.rb', 'db/migrate/create_simple_admin_entity_field_settings_migration.rb'

        migration_template 'migrations/core_migrations/layouts_migration.rb', 'db/migrate/create_simple_admin_layouts_migration.rb'
        migration_template 'migrations/core_migrations/layout_plugins_migration.rb', 'db/migrate/create_simple_admin_layout_plugins_migration.rb'

        migration_template 'migrations/core_migrations/posts_migration.rb', 'db/migrate/create_simple_admin_posts_migration.rb'
        migration_template 'migrations/core_migrations/categories_migration.rb', 'db/migrate/create_simple_admin_categories_migration.rb'
        migration_template 'migrations/core_migrations/plugins_migration.rb', 'db/migrate/create_simple_admin_plugins_migration.rb'
        migration_template 'migrations/core_migrations/plugin_types_migration.rb', 'db/migrate/create_simple_admin_plugin_types_migration.rb'
        migration_template 'migrations/core_migrations/settings_migration.rb', 'db/migrate/create_simple_admin_settings_migration.rb'

        migration_template 'migrations/core_data_migration.rb', 'db/migrate/create_simple_admin_core_data_migration.rb'

        # PLUGINS #
        migration_template 'migrations/plugins/featured_migration.rb', 'db/migrate/create_simple_admin_featured_plugin_migration.rb'
      end
    end
  end
end