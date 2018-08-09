require 'net/http'
require 'uri'
require 'json'

def get_data_api
  uri = URI.parse("https://api.github.com/repos/Dinda-com-br/braspag-rest/commits")
  @response = Net::HTTP.get_response(uri)
  # Net::HTTP.get_print(uri)
end

def set_data
  get_data_api
  value_api = JSON.parse(@response.body)
  value_api.each_with_index do |data, key|
    datas = {
      "name" => data["commit"]["committer"]["name"],
      "email" => data["commit"]["committer"]["email"],
      "commits_count" => ""
    }
    if data["committer"]["avatar_url"] == nil
      datas.merge!({"login" => ""})
    else
      datas.merge!({"login" => data["committer"]["login"]})
    end

    if data["committer"]["avatar_url"] == nil
      datas.merge!({"avatar_url" => ""})
    else
      datas.merge!({"avatar_url" => data["committer"]["avatar_url"]})
    end
    puts datas
    all_data = Array.new
    all_data[key] = datas
  end
end


def main
  set_data
end

main
