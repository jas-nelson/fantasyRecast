#!/usr/bin/ruby -w

require_relative "getToken.rb"
require_relative "movieDB.rb"

movieDBTokenObj = MovieDBToken. new
token = movieDBTokenObj.get_token
# puts token

movieDBObj = MovieDB. new
puts movieDBObj.search("pulp fiction")
