require_relative "../../../lib/parsers/weblog_parser"

module Parsers
  describe WeblogParser do
    let(:test_file_location) {File.expand_path('../../parsers/test_files/webserver.log', __FILE__)}
    let(:parser) {Parsers::WeblogParser.new({ weblog_location: test_file_location })}

    it 'saves the location of the weblog in its instance variable' do
      expect(Parsers::WeblogParser.new({ weblog_location: 'foo' }).instance_variable_get('@weblog_location')).to eq 'foo'
    end

    it 'returns cached copy of the parsed weblog' do
      parser = Parsers::WeblogParser.new({ weblog_location: 'foo' })
      parser.instance_variable_set(:'@parsed_weblog', [{'address' => 'ip_number'}])
      expect(parser.parse).to eq ([{'address' => 'ip_number'}])
    end

    it 'parses the weblog into the object' do
      expect(parser.parse).to include(["/help_page/1", "126.318.035.038"])
      expect(parser.parse).to include(["/contact", "184.123.665.067"])
      expect(parser.parse).to include(["/home", "184.123.665.067"])
    end

    it 'returns most page views count for home key' do
      expect(parser.most_page_views).to eq [["/about/2", 90], ["/contact", 89], ["/index", 82], ["/about", 81], ["/help_page/1", 80], ["/home", 78]]
    end

    it 'returns unique page views object' do
      expect(parser.most_unique_page_views).to eq [["/index", 23], ["/home", 23], ["/contact", 23], ["/help_page/1", 23], ["/about/2", 22], ["/about", 21]]
    end
  end
end
