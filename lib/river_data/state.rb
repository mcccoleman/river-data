require_relative 'utils/base'

module RiverData
  class State < Base
    def self.find(state)
      Request.make_request("stateCd=#{state}")
    end
  end
end
