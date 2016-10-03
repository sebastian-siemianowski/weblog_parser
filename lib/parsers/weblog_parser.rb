module Parsers
  class WeblogParser
    def initialize(options)
      @weblog_location = options[:weblog_location]
    end

    def parse
      return @parsed_weblog if @parsed_weblog
      parsed_object = []
      File.open(@weblog_location).each do |line|
        split_line = line.split
        parsed_object << [split_line[0], split_line[1]]
      end
      @parsed_weblog = parsed_object
    end

    def page_views_hash
      return @page_views_hash if @page_views_hash

      result_hash = {}
      parsed_weblog = self.parse
      parsed_weblog.each do |line|
        if result_hash[line[0]].nil?
          result_hash[line[0]] = []
        end

        result_hash[line[0]] << line[1]
      end

      @page_views_hash = result_hash
    end

    def most_page_views
      return @sorted_page_views if @sorted_page_views
      unique = false

      @sorted_page_views = page_view_result_set(unique)
    end

    def most_unique_page_views
      return @sorted_unique_page_views if @sorted_unique_page_views
      unique = true

      @sorted_unique_page_views = page_view_result_set(unique)
    end

    def page_view_result_set(unique)
      page_hash = page_views_hash
      result_set = []
      page_hash.each do |key, value|
        url = key
        if unique
          url_count = value.uniq.size
        else
          url_count = value.size
        end

        result_set << [url, url_count]
      end

      result_set.sort {|x,y|  x[1] <=> y[1]}.reverse!
    end
  end
end