class FetchJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
    puts "HELLO"
  end
end
