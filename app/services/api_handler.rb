require 'net/http'
require 'json'

class ApiHandler
  BASE_URL = 'https://jsonplaceholder.typicode.com'

  def fetch_posts
    endpoint = 'posts'
    response = get_request(endpoint)
    handle_response(response)
  end

  def fetch_post(post_id)
    endpoint = "posts/#{post_id}"
    response = get_request(endpoint)
    handle_response(response)
  end

  private

  def get_request(endpoint)
    uri = URI("#{BASE_URL}/#{endpoint}")
    Net::HTTP.get_response(uri)
  end

  def handle_response(response)
    case response
    when Net::HTTPSuccess
      JSON.parse(response.body)
    else
      raise "HTTP Request failed (status code: #{response.code})"
    end
  end
end
