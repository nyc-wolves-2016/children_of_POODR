require_relative 'toilet'

class ToiletsInParks
  attr_reader :toilets


  def initialize(base_url, query_string)
    @base_url = base_url
    @query_string = query_string
    @toilets = ruby_hash_response
  end


  def json_string_response
    open(@base_url + '?' + @query_string).read 
  end

  def ruby_hash_response
    JSON.parse(json_string_response)
  end

  def add_toilets
    @toilets.map! do |row|
      Toilet.new(row)
    end 
  end

  def location_response
    @toilets.map do |toilet|
      "#{toilet.location} in #{toilet.name} in #{toilet.borough}"
    end

  end


end