require 'fileutils'
require 'csv'
require 'date'
require "net/http"

@input_file = File.join(File.dirname(__FILE__), "../data/vixta.csv")
@hostURL = "stockcollector.herokuapp.com"
@vol = "/volatilities/4f1fee0e9708990003000026/vol_values"

desc "Load Volatility Data"
task :load_vix do
  http = Net::HTTP.new(@hostURL)
  request = Net::HTTP::Post.new(@vol)
  request.content_type = 'application/json'

  CSV.read(@input_file).reject {|x| x.first.nil? }.each_with_index do |row, i|
    next if i == 0 # skip headers
    row[0] = row[0].to_s.strip
    value = row[1].to_s.strip
    the_date = Date.strptime(row[0], '%d.%m.%y')
    params = ActiveSupport::JSON.encode(:timestamp => the_date, :value => value)
    request.body = params
    response = http.request(request)
    if response.code != '200'
      puts "Error adding: #{params}" 
    else
      puts "Added: #{params}" 
    end
  end
end
