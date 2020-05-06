require "sinatra"
require "sinatra/reloader" if development?
require "time_difference"
require "json"


helpers do
  # Takes a time object and returns how much time has passed
  # since that provided time as a humanized string.
  def time_since_in_words(date)
    TimeDifference.between(date, Time.now).humanize
  end
  def load_file (file)
    load_file= File.read(file)
    JSON.parse(load_file)
  end
  def time_ago(time)
    time_since_in_words(Time.at(time)).split(",")[0]
  end
  def extract_path(url)
    url.match(/https?:\/\/(?<path>[\w.]+)\/.+/)[:path]
  end
  
end

# time_since_win_words helper demostration
get "/" do
  test_time = Time.now - (60 * 5) # 5 minutes ago
  "#{time_since_in_words(test_time)} ago"
end

get "/hackerNews" do
  @stories = load_file("stories.json")
  @page = params.fetch("page",1).to_i
  @pagination = Pagination.new(@stories,@page)
  erb :index
end

