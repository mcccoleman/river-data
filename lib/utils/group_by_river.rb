module Utils
  class GroupByRiver
    def self.group(data)
      hash_of_site_keys = data.group_by do |site|
        site['sourceInfo']['siteCode'].first['value']
      end

      hash_of_site_keys.keys.map do |key|
        {
          'sourceInfo' => hash_of_site_keys[key].first['sourceInfo'],
          'metrics' => hash_of_site_keys[key].map do |river|
            {
              'variable' => river['variable'],
              'values' => river['values'],
              'name' => river['name']
            }
          end
        }
      end
    end
  end
end
