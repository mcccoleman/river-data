require_relative 'utils/base'

module RiverData
  class Counties < Base
    def self.find(county_codes)
      county_string = county_codes.join(',')
      Request.make_request("countyCd=#{county_string}")
    end
  end
end
