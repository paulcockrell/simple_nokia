NokiaMaps
=======
NokiaMaps is Rails 3.x Gem for generating the JS code required for displaying Nokia Maps.

Usage
=======
Setting up your rails 3 app to use Nokia Maps

1. Gemfile
  In your Gemfile, add this line:
    gem 'nokia_maps'

1. Layout
  Include Nokia maps JS in layout:
  <%= javascript_include_tag "http://api.maps.nokia.com/2.2.0//jsl.js?with=all" %>

1. Controller
  In your controller, create a new Nokia map object and set up its variables
  As a minimum you will need your developers appId and authentication_token
  You will probably want to set your latitude and longitude variables at this
  point to as shown in the example. If not the map will display a default
  point on your map

  To obtain your Nokia developer keys, you must register with Nokia here:
  * https://www.developer.nokia.com/Profile/Join.xhtml
  Once you have registered you will need to generate your keys here:
  * http://api.developer.nokia.com/

  {{{
    @nm = NokiaMaps::NokiaMap.new do |map|
      map.options[:app_id] = "your_developer_app_id"
      map.options[:authentication_token] = "your_authentication_token"
      map.options[:map] = {:latitude => 50, :longitude => 0}
    end
  }}}
 
1. View
  Call helper method to generate the JS and element to render the map to:
  <%= nokia_map("new_element_id", @nm) %>

Contributors
=======
	LazyNokiaMaps gem is maintained by Paul Cockrell, https://github.com/paulcockrell

Copyright (c) 2012 Paul Cockrell, released under the MIT license
