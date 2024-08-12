class FetchJob
  include Sidekiq::Job

  def perform(*args)
    # Do something

    Blog.create(title:title, body:body)
    puts "HELLO"
  end
end
