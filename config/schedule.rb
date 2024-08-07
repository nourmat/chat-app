# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/log/cron.log"

# TODO: THIS IS whenever gem

# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

every 1.minute do
  runner "Application::UpdateChatCountJob.perform_async"
  runner "Chat::UpdateMessageCountJob.perform_async"
end

# Learn more: http://github.com/javan/whenever

# ATTENTION
# run this after updating the file
# whenever --update-crontab
