module SimpleNokia
  class Map
    CANVAS_DEFAULT_HTML_OPTIONS = { :container => 'map', :style => "height: 300px, width:300px" }
    VALID_COMPONENTS = %w{ Behavior ZoomBar Overview TypeSelector ScaleBar }
    attr_accessor :options, :html_options, :markers

    class Marker
      attr_accessor :latitude, :longitude, :options

      def initialize(latitude, longitude, opts={})
        @latitude = latitude
        @longitude = longitude
        @options = opts
      end
    end

    def initialize(container = nil, html_opts = {})
      @markers = []
      self.tap do |map|
        map.options ||= {}
        map.defaults_options
        map.html_options = html_opts.reverse_merge(CANVAS_DEFAULT_HTML_OPTIONS)
        map.html_options.merge({:container=>container}) if container
        yield map if block_given?
      end
    end

    def defaults_options
      self.options[:app_id] = nil
      self.options[:authentication_token] = nil
      self.options[:latitude] = 50
      self.options[:longitude] = 0
      self.options[:components] = ['ZoomBar', 'Behavior']
    end

    def self.valid_components
      VALID_COMPONENTS
    end

    def method_missing(meth, opts = {})
      merge_options meth, opts
    end

    def add_marker(lat, lon, opts = {})
      raise if lat.nil? || lon.nil?
      marker = Marker.new(lat, lon, opts)
      @markers << marker
    end

    private

    def merge_options(name, opts)
      @options.merge! name => opts
    end

  end # class
end # module
