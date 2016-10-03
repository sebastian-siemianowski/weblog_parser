require_relative "lib/parsers/weblog_parser"
require_relative "lib/presenters/web_log_presenter"

relative_file_path = "../#{ARGV[0]}"

absolute_file_path = File.expand_path(relative_file_path, __FILE__)

parser = Parsers::WeblogParser.new({ weblog_location: absolute_file_path})

presenter = Presenters::WeblogPresenter.new({parser: parser})
presenter.most_visited_page_views
presenter.most_unique_page_views
