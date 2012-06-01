require File.join(File.dirname(__FILE__), *%w[simple_nokia places])
require File.join(File.dirname(__FILE__), *%w[simple_nokia map])
require File.join(File.dirname(__FILE__), *%w[simple_nokia layout_helper])
require File.join(File.dirname(__FILE__), *%w[simple_nokia railtie]) if defined?(::Rails::Railtie)

module SimpleNokia

end
