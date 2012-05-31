require File.join(File.dirname(__FILE__), *%w[lazy_nokia_maps nokia_map])
require File.join(File.dirname(__FILE__), *%w[lazy_nokia_maps layout_helper])
require File.join(File.dirname(__FILE__), *%w[lazy_nokia_maps railtie]) if defined?(::Rails::Railtie)

module LazyNokiaMaps

end
