module LazyNokiaMaps
  class NokiaMap
    CANVAS_DEFAULT_HTML_OPTIONS = { :style => "height: 300px, width:300px" }

    attr_accessor :options, :placeholder, :html_options
    alias  :canvas :placeholder
    alias  :canvas= :placeholder=

    def initialize(canvas = nil, html_opts = {})

      @collection_filter = nil
      self.tap do |nokia_map|
        nokia_map.options    ||= {}
        nokia_map.defaults_options
        nokia_map.html_options = html_opts.reverse_merge(CANVAS_DEFAULT_HTML_OPTIONS)
        nokia_map.canvas       = canvas if canvas
        yield high_chart if block_given?
      end
    end

    def defaults_options
      self.coords({ :latitude => 50, :longitude => 13 })
    end

    # Pass other methods through to the javascript nokia_map object.
    #
    # For instance: <tt>high_chart.grid(:color => "#699")</tt>
    #
    def method_missing(meth, opts = {})
      merge_options meth, opts
    end


private

    def merge_options(name, opts)
      @options.merge!  name => opts
    end

end
