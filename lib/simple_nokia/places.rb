require 'open-uri'
require 'zlib'
require 'json'

module SimpleNokia
  class Places
    include Rack::Utils
    PBAPI_BASE_URL = "http://demo.places.nlp.nokia.com/places/v1"
    CREDENTIALS = "app_id=demo_qCG24t50dHOwrLQ&app_code=NYKC67ShPhQwqaydGIW4yg"

    def initialize(request)
      @request = request
      raise if @request.nil?
    end

    def fetch_explore_results_for(coords)
      explore_url = "#{PBAPI_BASE_URL}/discover/explore?#{CREDENTIALS}&at=#{coords.join(',')}"
      fetch_parsed_pbapi_response(explore_url)
    end
    
    def fetch_parsed_pbapi_response(url, headers={})
      standard_headers = {
        "Accept" => "application/json",
        "Accept-Language" => @request.env["HTTP_ACCEPT_LANGUAGE"],
        "Accept-Encoding" => "gzip"
      }
      JSON.parse(open_gzip(url, standard_headers.merge(headers)).read)
    end
    
    def open_gzip(url, headers)
      Zlib::GzipReader.new(open(url, headers))
    end

  end #class
end #module
