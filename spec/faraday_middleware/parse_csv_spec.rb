require 'spec_helper'

describe FaradayMiddleware::ParseCSV do
  before(:each) do
    headers = { 'Content-Type' => 'text/csv;charset=UTF-8' }
    body    = 'one,two,three'
    utf8bom = "\xEF\xBB\xBF"

    @connection = Faraday.new do |builder|
      builder.response :csv, parser: { encoding: 'bom|utf-8' }
      builder.adapter :test do |stub|
        stub.get('/normal') do
          [200, headers, body]
        end

        stub.get('/utf8') do
          [200, headers, "#{utf8bom}#{body}"]
        end
      end
    end
  end

  it 'parses the response of a csv string' do
    expect(@connection.get('/normal').body).to eq [%w(one two three)]
  end

  it 'parses the response of a utf-8 bom string' do
    expect(@connection.get('/utf8').body).to eq [%w(one two three)]
  end
end
