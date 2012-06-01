SimpleNokia
=======
SimpleNokia is Rails 3.x Gem for:
 a. Generating the JS code required for displaying Nokia Maps.
 a. Retrieving places of interestest near a given location via Nokia PLaces

Usage
=======
Setting up your rails 3 app to use Nokia Maps

1. Gemfile
  In your Gemfile, add this line:
    gem 'simple_nokia'

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
    @nm = SimpleNokia::Map.new do |my_map|
      my_map.options[:app_id] = "your_developer_app_id"
      my_map.options[:authentication_token] = "your_authentication_token"
      my_map.options[:map] = {:latitude => 50, :longitude => 0}
    end
  }}}
 
1. View
  Call helper method to generate the JS and element to render the map to:
  <%= nokia_map("new_element_id", @nm) %>

Contributors
=======
	SimpleNokia gem is maintained by Paul Cockrell, https://github.com/paulcockrell

Copyright (c) 2012 Paul Cockrell, released under the MIT license
