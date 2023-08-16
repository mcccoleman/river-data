require 'river_data'

RSpec.describe Utils::GroupByRiver do
  context 'when multiple metrics exist for a site' do
    it 'groups those sites together' do
      response = described_class.group(
        [
          {
            'sourceInfo' => {
              'siteName' => 'St. John River at Ninemile Bridge, Maine',
              'siteCode' => [
                { 'value' => '01010000', 'network' => 'NWIS', 'agencyCode' => 'USGS' }
              ],
              'timeZoneInfo' =>
     {
       'defaultTimeZone' => {
         'zoneOffset' => '-05:00', 'zoneAbbreviation' => 'EST'
       },
       'daylightSavingsTimeZone' => {
         'zoneOffset' => '-04:00', 'zoneAbbreviation' => 'EDT'
       }, 'siteUsesDaylightSavingsTime' => true
     },
              'geoLocation' => {
                'geogLocation' => { 'srs' => 'EPSG:4326', 'latitude' => 46.70055556, 'longitude' => -69.7155556 },
                'localSiteXY' => []
              },
              'note' => [],
              'siteType' => [],
              'siteProperty' => [
                { 'value' => 'ST', 'name' => 'siteTypeCd' }, { 'value' => '01010001', 'name' => 'hucCd' },
                { 'value' => '23', 'name' => 'stateCd' }, { 'value' => '23003', 'name' => 'countyCd' }
              ]
            },
            'values' => 'random',
            'variable' => 'random',
            'name' => 'random'
          },
          {
            'sourceInfo' => {
              'siteName' => 'St. John River at Ninemile Bridge, Maine',
              'siteCode' => [
                { 'value' => '01010000', 'network' => 'NWIS', 'agencyCode' => 'USGS' }
              ],
              'timeZoneInfo' =>
     {
       'defaultTimeZone' => {
         'zoneOffset' => '-05:00', 'zoneAbbreviation' => 'EST'
       },
       'daylightSavingsTimeZone' => {
         'zoneOffset' => '-04:00', 'zoneAbbreviation' => 'EDT'
       }, 'siteUsesDaylightSavingsTime' => true
     },
              'geoLocation' => {
                'geogLocation' => { 'srs' => 'EPSG:4326', 'latitude' => 46.70055556, 'longitude' => -69.7155556 },
                'localSiteXY' => []
              },
              'note' => [],
              'siteType' => [],
              'siteProperty' => [
                { 'value' => 'ST', 'name' => 'siteTypeCd' }, { 'value' => '01010001', 'name' => 'hucCd' },
                { 'value' => '23', 'name' => 'stateCd' }, { 'value' => '23003', 'name' => 'countyCd' }
              ]
            },
            'values' => 'random2',
            'variable' => 'random2',
            'name' => 'random2'
          }
        ]
      )

      expect(response).to match_array(
        [
          {
            'sourceInfo' => {
              'siteName' => 'St. John River at Ninemile Bridge, Maine',
              'siteCode' => [
                { 'value' => '01010000', 'network' => 'NWIS', 'agencyCode' => 'USGS' }
              ],
              'timeZoneInfo' =>
       {
         'defaultTimeZone' => {
           'zoneOffset' => '-05:00', 'zoneAbbreviation' => 'EST'
         },
         'daylightSavingsTimeZone' => {
           'zoneOffset' => '-04:00', 'zoneAbbreviation' => 'EDT'
         }, 'siteUsesDaylightSavingsTime' => true
       },
              'geoLocation' => {
                'geogLocation' => { 'srs' => 'EPSG:4326', 'latitude' => 46.70055556,
                                    'longitude' => -69.7155556 },
                'localSiteXY' => []
              },
              'note' => [],
              'siteType' => [],
              'siteProperty' => [
                { 'value' => 'ST', 'name' => 'siteTypeCd' }, { 'value' => '01010001', 'name' => 'hucCd' },
                { 'value' => '23', 'name' => 'stateCd' }, { 'value' => '23003', 'name' => 'countyCd' }
              ]
            },
            'metrics' => [
              {
                'values' => 'random',
                'variable' => 'random',
                'name' => 'random'
              },
              {
                'values' => 'random2',
                'variable' => 'random2',
                'name' => 'random2'
              }
            ]

          }
        ]
      )
    end
  end
end
