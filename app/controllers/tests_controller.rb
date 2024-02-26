class TestsController < ApplicationController
  require 'net/http'
  require 'uri'

  def external_request
    uri = URI('https://api.publicapis.org/entries')
    response = Net::HTTP.get(uri)
    render json: response
  end
end
