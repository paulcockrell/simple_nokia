require 'lazy_nokia_maps'
require 'lazy_nokia_maps/layout_helper.rb'

require 'rails'

module LazyNokiaMaps

    class Railtie < ::Rails::Railtie
      config.before_configuration do
        config.action_view.javascript_expansions[:nokia_maps] = %w(nokiamaps)
      end

      initializer 'lazy_nokia_maps.initialize' do
        ActiveSupport.on_load(:action_view) do
          include LazyNokiaMaps::LayoutHelper
        end
      end
    end
    
end
