require 'faraday'
require 'json'

module RiverData
  module Request
    def make_request(params)
      response = Faraday.get(
        "https://waterservices.usgs.gov/nwis/iv/?format=json&#{params}"
      )
      return JSON.parse(response.body) if response.status == 200

      { status: response.status, message: response.body }
    end
    module_function :make_request
  end
end
