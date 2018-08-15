require 'json'
require 'open-uri'

namespace :universities do
  desc "importing list of universities"
  task :import => :environment do
    url = "http://universities.hipolabs.com/search?name"

    puts "Parsing the API json..."
    unis_json = JSON.parse(open(url).read)
    unis_json.each do |hash|
      params = hash.slice('country', 'name')
      params['domain'] = hash.dig('domains')&.first
      params['web_page'] = hash.dig('web_pages')&.first

      puts "Creating new university with #{params}"
      University.create(params)
    end

    puts "Done"
  end
end
