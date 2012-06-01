# coding: utf-8
module SimpleNokia
  module LayoutHelper

    def nokia_map(placeholder, object, &block)
      object.html_options.merge!({:id=>placeholder})
      object.options[:renderTo] = placeholder
      generate_map(placeholder,object).concat(content_tag("div","", object.html_options))
    end

    def generate_map(placeholder, object, &block)
      map =<<-EOJS
      <script type="text/javascript">
      jQuery(function() {
        console.log("Generating map");
        var container = document.getElementById(#{object.options[:renderTo].inspect});
        nokia.Settings.set("appId", #{object.options[:app_id].to_json});
        nokia.Settings.set("authenticationToken", #{object.options[:authentication_token].to_json});
        var map = new nokia.maps.map.Display(container,
          {
            center: [#{object.options[:latitude]}, #{object.options[:longitude]}],
            zoomLevel: #{object.options[:zoom] || 10}
          }
        );
        // Interactivity options
        //
      EOJS
      object.options[:components].each do |component|
        map +=<<-EOJS
          #{add_component(component)}
        EOJS
      end
      map +=<<-EOJS
        var _center = null;
      EOJS
      object.markers.each_with_index do |marker, idx|
        map +=<<-EOJS
        _center = new nokia.maps.geo.Coordinate(#{marker.latitude}, #{marker.longitude});
        map.objects.add( new nokia.maps.map.StandardMarker(_center, {text:#{idx}}) );
        EOJS
      end
      map +=<<-EOJS
      });
      </script>
      EOJS

      if defined?(raw)
        return raw(map)
      else
        return map
      end

    end

  private

    def add_component(component)
      js = []
      component = component.to_s
      valid_components = SimpleNokia::Map.valid_components
      if valid_components.include?(component)
          js << "map.addComponent( new nokia.maps.map.component.#{component}() );"
      end

      return js.join(" ")
    end

  end # class
end # module
