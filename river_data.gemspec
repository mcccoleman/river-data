Gem::Specification.new do |s|
  s.name = 'river_data'
  s.version     = '0.0.0'
  s.summary     = 'River data is a gem to provide USGS data on United States Rivers.'
  s.description = 'River data is a gem to provide USGS data on United States Rivers.'
  s.authors     = ['michael coleman']
  s.email       = 'colemanmc02@gmail.com'
  s.files       = ['lib/river_data.rb',
                   'lib/river_data/utils/base.rb',
                   'lib/river_data/utils/request.rb',
                   'lib/river_data/counties.rb',
                   'lib/river_data/hydraulic_unit_codes.rb',
                   'lib/river_data/latitude_longitude.rb',
                   'lib/river_data/sites.rb',
                   'lib/river_data/state.rb',
                   'lib/river_data/counties.rb']
  s.license = 'MIT'
end
