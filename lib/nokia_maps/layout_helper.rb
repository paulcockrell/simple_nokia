# coding: utf-8
module NokiaMaps
  module LayoutHelper
    
    def nokia_map(placeholder, object, &block)
      object.html_options.merge!({:id=>placeholder})
      object.options[:map][:renderTo] = placeholder
      generate_map(placeholder,object).concat(content_tag("div","", object.html_options))
    end

    def generate_map(placeholder, object, &block)
      graph =<<-EOJS
      <script type="text/javascript">
      jQuery(function() {
            console.log("Generating map");
            var container = document.getElementById(#{object.options[:map][:renderTo].inspect});
            nokia.Settings.set("appId", #{object.options[:app_id].to_json});
            nokia.Settings.set("authenticationToken", #{object.options[:authentication_token].to_json});
            var map = new nokia.maps.map.Display(container,
              {
                center: [#{object.options[:map][:latitude]}, #{object.options[:map][:longitude]}],
                zoomLevel: #{object.options[:map][:zoom] || 10}
              }
            );
        });
        </script>
      EOJS

      if defined?(raw)
        return raw(graph)
      else
        return graph
      end

    end

  end # class
end # module
