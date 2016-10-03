module Presenters
  class WeblogPresenter
    def initialize(options)
      @parser = options[:parser]
    end

    def most_visited_page_views
      puts
      @parser.most_page_views.each do |page|
        puts "#{page[0]} #{page[1]} visits"
      end

      puts
    end

    def most_unique_page_views
      @parser.most_unique_page_views.each do |page|
        puts "#{page[0]} #{page[1]} unique visits"
      end

      puts
    end
  end
end