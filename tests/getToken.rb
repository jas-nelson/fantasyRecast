#!/usr/bin/ruby -w
require 'uri'
require 'net/http'
require 'OpenSSL'
require 'json'

#TODO: capture the token value here and return it to an object that calls this module
#TODO: implement a routine that validates whether the current token is valid or not

class MovieDBToken

  @@APIKEY = "701d0c9564c3f62c0f1279031b1dad2e"
  def initialize
  end

  def get_token
    url = URI("https://api.themoviedb.org/3/authentication/token/new?api_key=" + @@APIKEY)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request.body = "{}"

    response = http.request(request)

    jsonResponse = JSON.parse(response.read_body)
    return jsonResponse["request_token"]
  end
end
