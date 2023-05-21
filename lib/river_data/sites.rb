require_relative 'utils/base'

module RiverData
  class Sites < Base
    def self.find(sites)
      site_string = sites.join(',')
      Request.make_request("sites=#{site_string}")
    end
  end
end
