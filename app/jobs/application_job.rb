class ApplicationJob
    include Sidekiq::Worker
    sidekiq_options queue: 'default', retry: 5, unique_for: 15.minutes

  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
end
