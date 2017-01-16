#!/usr/bin/ruby -w

require 'uri'
require 'net/http'
require 'OpenSSL'
require 'json'

authenticationURL = URI("https://www.themoviedb.org/authenticate/" + jsonResponse["request_token"])
authenticateHTTP = Net::HTTP.new(authenticationURL.host, authenticationURL.port)
authenticateHTTP.use_ssl = true
authenticateHTTP.verify_mode = OpenSSL::SSL::VERIFY_NONE

# send authentication request
authenticateReq = Net::HTTP::Get.new(authenticationURL)
authenticateReq.body = "{}"
puts authenticateReq

# get response (pass request obj to http obj)
authResponse = authenticateHTTP.request(authenticateReq)
puts authResponse.read_body
