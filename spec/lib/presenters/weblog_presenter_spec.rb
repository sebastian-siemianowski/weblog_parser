require_relative "../../../lib/presenters/web_log_presenter"
require_relative "../../../lib/parsers/weblog_parser"

module Presenters
  describe WeblogPresenter do
    let(:test_file_location) {File.expand_path('../../parsers/test_files/webserver.log', __FILE__)}
    let(:parser) {Parsers::WeblogParser.new({ weblog_location: test_file_location })}

    it 'presents the most visited views' do
      presenter = Presenters::WeblogPresenter.new({parser: parser})
      presenter.most_visited_page_views
    end

    it 'presents the most unique views' do
      presenter = Presenters::WeblogPresenter.new({parser: parser})
      presenter.most_unique_page_views
    end
  end
end
