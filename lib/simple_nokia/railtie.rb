require 'nokia_maps'
require 'nokia_maps/layout_helper.rb'

require 'rails'

module NokiaMaps

    class Railtie < ::Rails::Railtie
      initializer 'nokia_maps.initialize' do
        ActiveSupport.on_load(:action_view) do
          include NokiaMaps::LayoutHelper
        end
      end
    end

end
