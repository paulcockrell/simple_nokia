# coding: utf-8
module LazyNokiaMaps
  module LayoutHelper
    
    def nokia_map(placeholder, object  , &block)
      object.html_options.merge!({:id=>placeholder})
      object.options[:chart][:renderTo] = placeholder
      generate_map(placeholder,object).concat(content_tag("div","", object.html_options))
    end

    def generate_map(placeholder, object, &block)
      graph =<<-EOJS
      <script type="text/javascript">
      jQuery(function() {
            nokia.Settings.set("appId", #{object.options[:appId]}");
            nokia.Settings.set("authenticationToken", #{object.options[:authToken]}");

            var map = nokia.maps.map.Display(@container,
              {
                center: [x, y],
                zoomLevel: opts.zoom
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
