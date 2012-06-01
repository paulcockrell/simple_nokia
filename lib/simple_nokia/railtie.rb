require 'simple_nokia'
require 'simple_nokia/layout_helper.rb'

require 'rails'

module SimpleNokia

    class Railtie < ::Rails::Railtie
      initializer 'simple_nokia.initialize' do
        ActiveSupport.on_load(:action_view) do
          include SimpleNokia::LayoutHelper
        end
      end
    end

end
