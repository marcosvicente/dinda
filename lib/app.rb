require 'net/http'
require "net/http"
require "uri"

def get_data_api
  uri = URI.parse("https://api.github.com/repos/Dinda-com-br/braspag-rest/commits")
  @response = Net::HTTP.get_response(uri)
  Net::HTTP.get_print(uri)
end

def set_data
  get_data_api
  @response.each do |e|
  end
end

def main
  set_data
end

main
