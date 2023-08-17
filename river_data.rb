require_relative 'lib/river_data'
require 'sinatra'
require 'sinatra/cross_origin'
require 'pry'

configure do
  enable :cross_origin
end

options '/state/:code' do
  200
end

get '/state/:stateCode' do
  state_code = params[:stateCode]

  resp = RiverData::State.find(state_code)
  filtered_data = Utils::GetTodaysValues.get(resp)

  Utils::GroupByRiver.group(filtered_data).to_json
end

get '/site/:siteCode' do
  site_code = params[:siteCode]
  RiverData::Sites.find([site_code]).to_json
end
