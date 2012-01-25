require 'csv'
require 'date'
require "net/http"

desc "Load Asset Data"
task :load_asset do
  @input_file = File.join(File.dirname(__FILE__), "../data/ta25.csv")
  @hostURL = "stockcollector.herokuapp.com"
  @vol = "/assets/1091826/values"

  http = Net::HTTP.new(@hostURL)
  request = Net::HTTP::Post.new(@vol)
  request.content_type = 'application/json'

  CSV.read(@input_file).reject {|x| x.first.nil? }.each_with_index do |row, i|
    next if i == 0 # skip headers
    row[0] = row[0].to_s.strip
    value = row[1].to_s.strip
    the_date = Date.strptime(row[0], '%d/%m/%Y')
    params = ActiveSupport::JSON.encode(:timestamp => the_date, :price => value)
    request.body = params
    response = http.request(request)
    if response.code != "200"
      puts "Error(#{response.code}) adding: #{params}" 
    else
      puts "Added: #{params}" 
    end
  end
end
