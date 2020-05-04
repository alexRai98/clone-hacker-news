require "sinatra"
require "sinatra/reloader" if development?
require "time_difference"

helpers do
  # Takes a time object and returns how much time has passed
  # since that provided time as a humanized string.
  def time_since_in_words(date)
    TimeDifference.between(date, Time.now).humanize
  end
end

# time_since_win_words helper demostration
get "/" do
  test_time = Time.now - (60 * 5) # 5 minutes ago
  "#{time_since_in_words(test_time)} ago"
end