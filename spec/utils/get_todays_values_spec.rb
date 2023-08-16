require 'river_data'
require 'active_support/all'

RSpec.describe Utils::GetTodaysValues do
  context 'when a site has multiple time values' do
    it 'filters those values out' do
      response = described_class.get(
        {
          'name' => 'random',
          'declaredType' => 'random',
          'scope' => 'random',
          'value' => {
            'timeSeries' => [
              {
                'values' => [
                  { 'value' => [
                      {
                        'value' => '0.00',
                        'qualifiers' => ['A'],
                        'dateTime' => Time.now.to_s
                      }
                    ],
                    'qualifier' => [
                      {
                        'qualifierCode' => 'A',
                        'qualifierDescription' => 'Approved for publication -- Processing and review completed.',
                        'qualifierID' => 0,
                        'network' => 'NWIS',
                        'vocabulary' => 'uv_rmk_cd'
                      }
                    ],
                    'qualityControlLevel' => [],
                    'method' => [{ 'methodDescription' => '[Permanent]', 'methodID' => 67_703 }],
                    'source' => [],
                    'offset' => [],
                    'sample' => [],
                    'censorCode' => [] },
                  { 'value' => [
                      {
                        'value' => '0.00',
                        'qualifiers' => ['P'],
                        'dateTime' => Time.now.to_s
                      }
                    ],
                    'qualifier' => [
                      { 'qualifierCode' => 'P',
                        'qualifierDescription' => 'Provisional data subject to revision.',
                        'qualifierID' => 0, 'network' => 'NWIS', 'vocabulary' => 'uv_rmk_cd' }
                    ],
                    'qualityControlLevel' => [],
                    'method' => [{ 'methodDescription' => '', 'methodID' => 67_708 }],
                    'source' => [],
                    'offset' => [],
                    'sample' => [],
                    'censorCode' => [] }
                ]
              }

            ]
          }
        }
      )

      expect(response).to match_array([])
    end
  end

  context 'when a site has multiple time values' do
    it 'filters those values out' do
      response = described_class.get(
        {
          'name' => 'random',
          'declaredType' => 'random',
          'scope' => 'random',
          'value' => {
            'timeSeries' => [
              {
                'values' => [
                  { 'value' => [
                      {
                        'value' => '0.00',
                        'qualifiers' => ['A'],
                        'dateTime' => Time.now.to_s
                      }
                    ],
                    'qualifier' => [
                      { 'qualifierCode' => 'A',
                        'qualifierDescription' => 'Approved for publication -- Processing and review completed.',
                        'qualifierID' => 0,
                        'network' => 'NWIS',
                        'vocabulary' => 'uv_rmk_cd' }
                    ],
                    'qualityControlLevel' => [],
                    'method' => [{ 'methodDescription' => '[Permanent]', 'methodID' => 67_703 }],
                    'source' => [],
                    'offset' => [],
                    'sample' => [],
                    'censorCode' => [] }

                ]
              }
            ]
          }
        }
      )
      expect(response).to match_array(
        [{
          'values' => [
            { 'value' => [
                {
                  'value' => '0.00',
                  'qualifiers' => ['A'],
                  'dateTime' => Time.now.to_s
                }
              ],
              'qualifier' => [
                { 'qualifierCode' => 'A',
                  'qualifierDescription' => 'Approved for publication -- Processing and review completed.',
                  'qualifierID' => 0,
                  'network' => 'NWIS',
                  'vocabulary' => 'uv_rmk_cd' }
              ],
              'qualityControlLevel' => [],
              'method' => [{ 'methodDescription' => '[Permanent]', 'methodID' => 67_703 }],
              'source' => [],
              'offset' => [],
              'sample' => [],
              'censorCode' => [] }

          ]
        }]
      )
    end
  end

  context 'when a site has a date that occurred before today' do
    it 'filters that day out' do
      response = described_class.get(
        {
          'name' => 'random',
          'declaredType' => 'random',
          'scope' => 'random',
          'value' => {
            'timeSeries' => [
              {
                'values' => [
                  { 'value' => [
                      {
                        'value' => '0.00',
                        'qualifiers' => ['A'],
                        'dateTime' => (Time.now - 1.day).to_s
                      }
                    ],
                    'qualifier' => [
                      { 'qualifierCode' => 'A',
                        'qualifierDescription' => 'Approved for publication -- Processing and review completed.',
                        'qualifierID' => 0,
                        'network' => 'NWIS',
                        'vocabulary' => 'uv_rmk_cd' }
                    ],
                    'qualityControlLevel' => [],
                    'method' => [{ 'methodDescription' => '[Permanent]', 'methodID' => 67_703 }],
                    'source' => [],
                    'offset' => [],
                    'sample' => [],
                    'censorCode' => [] }

                ]
              }
            ]
          }
        }
      )

      expect(response).to match_array([])
    end
  end
end
