module NokiaMaps
  class NokiaMap
    CANVAS_DEFAULT_HTML_OPTIONS = { :container => 'map', :style => "height: 300px, width:300px" }
    attr_accessor :options, :html_options

    def initialize(container = nil, html_opts = {})
      self.tap do |nokia_map|
        nokia_map.options ||= {}
        nokia_map.defaults_options
        nokia_map.html_options = html_opts.merge(CANVAS_DEFAULT_HTML_OPTIONS)
        nokia_map.html_options.merge({:container=>container}) if container
        yield nokia_map if block_given?
      end
    end

    def defaults_options
      self.app_id = nil
      self.authentication_token = nil
      self.map({ :latitude => 50, :longitude => 0 })
    end

    def method_missing(meth, opts = {})
      merge_options meth, opts
    end


    private

    def merge_options(name, opts)
      opts = @options.has_key?(name) ? @options[name].merge(opts) : opts
      @options.merge!  name => opts
    end

  end # class
end # module
