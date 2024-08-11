require 'test_helper'
require 'webmock/minitest'

class ApiHandlerTest < ActiveSupport::TestCase
  def setup
    @api_handler = ApiHandler.new
  end

  def test_fetch_posts_success
    stub_request(:get, "https://jsonplaceholder.typicode.com/posts")
      .to_return(status: 200, body: [{ id: 1, title: 'Test Post' }].to_json, headers: {})

    response = @api_handler.fetch_posts
    assert_equal 1, response.size
    assert_equal 'Test Post', response.first['title']
  end

  def test_fetch_post_success
    stub_request(:get, "https://jsonplaceholder.typicode.com/posts/1")
      .to_return(status: 200, body: { id: 1, title: 'Test Post', body: 'Test body' }.to_json, headers: {})

    response = @api_handler.fetch_post(1)
    assert_equal 1, response['id']
    assert_equal 'Test Post', response['title']
    assert_equal 'Test body', response['body']
  end

  def test_fetch_post_failure
    stub_request(:get, "https://jsonplaceholder.typicode.com/posts/999")
      .to_return(status: 404)

    assert_raises(StandardError) { @api_handler.fetch_post(999) }
  end
end
