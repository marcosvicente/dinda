require 'net/http'
require 'uri'
require 'json'
require 'date'
def get_data_api
  uri = URI.parse("https://api.github.com/repos/Dinda-com-br/braspag-rest/commits")
  @response = Net::HTTP.get_response(uri)
end

def set_data
  get_data_api
  value_api = JSON.parse(@response.body)
  value_api.each_with_index do |data, key|
    @datas_name = Array.new
    @datas_name[key] = data["commit"]["committer"]["name"]

    @datas_email = Array.new
    @datas_email[key] = data["commit"]["committer"]["email"]

    @datas_login = Array.new
    if data["committer"]["login"].nil?
      @datas_login[key] = data["committer"]["login"]
    else
      break
      @datas_login[key] = ""
    end
    @datas_avatar_url = Array.new
    @datas_avatar_url[key] = data["committer"]["avatar_url"]
  end
end

def save_file
  set_data
  f= File.new("braspag-rest-#{DateTime.now}.txt", "w")
  key = 0
  while key <= @datas_name.length do
    f.write(@datas_name[key])
    f.write("\n")
    f.write(@datas_email[key])
    f.write("\n")

    # f.write(@datas_login[key])
    # f.write(@datas_avatar_url[key])
    key += 1
  end

  f.write(@all_data)
  f.close
end

def main
  save_file
end

main
