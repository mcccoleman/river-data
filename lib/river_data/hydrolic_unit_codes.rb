require_relative 'utils/base'

module RiverData
  class HydrolicUnitCodes < Base
    def self.find(unit_codes)
      unit_code_string = unit_codes.join(',')
      Request.make_request("huc=#{unit_code_string}")
    end
  end
end
