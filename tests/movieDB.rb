#!/usr/bin/ruby -w

require 'uri'
require 'net/http'
# require 'json'
require_relative 'getToken.rb'


class MovieDB

  def initialize
    #TODO: figure out how to use instance variables and set values with methods from other class instances
    # @tokenObj = MovieDBToken. new
    # @apikey = tokenObj.instance_variable_get("@@APIKEY")
    @apikey = "701d0c9564c3f62c0f1279031b1dad2e"

  end

#TODO: try using the Addressable gem rather than URI.escape which is now obsolete
  def search (query)
    escapedQuery = URI.escape(query)
    uriStr = "https://api.themoviedb.org/3/search/movie?include_adult=false&page=1&query=#{escapedQuery}&language=en-US&api_key=#{@apikey}"
    puts uriStr
    url = URI(uriStr)



    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request.body = "{}"

    response = http.request(request)
    return JSON.parse(response.read_body)
  end
end
