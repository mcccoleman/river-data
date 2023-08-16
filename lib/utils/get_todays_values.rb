module Utils
  class GetTodaysValues
    def self.get(river_data)
      all_sites = river_data['value']['timeSeries']
      all_data = all_sites.filter { |river| river['values'].count == 1 }

      all_data.filter do |river|
        date = DateTime.parse(
          river['values'].first['value'].first['dateTime']
        )

        date > Date.today
      end
    end
  end
end
