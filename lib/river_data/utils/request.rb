require 'faraday'
require 'json'

module RiverData
  module Request
    def make_request(params)
      JSON.parse(
        Faraday.get(
          "https://waterservices.usgs.gov/nwis/iv/?format=json&#{params}"
        ).body
      )
    end
    module_function :make_request
  end
end
