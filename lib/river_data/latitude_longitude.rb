require_relative 'utils/base'

module RiverData
  class LatitudeLongitude < Base
    def self.find(w_longitude, s_longitude, east_longitude, n_latitude)
      search_string = "#{w_longitude},#{s_longitude},#{east_longitude},#{n_latitude}"
      Request.make_request("bBox=#{search_string}")
    end
  end
end
