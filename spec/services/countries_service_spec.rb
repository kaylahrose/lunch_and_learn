require 'rails_helper'

RSpec.describe 'CountriesService' do
  it '#get_country_name returns country data' do
    response = CountriesService.get_country_name
    country = JSON.parse(response.body)
    expect
  end
end