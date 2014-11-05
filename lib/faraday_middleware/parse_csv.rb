require 'csv'
require 'faraday'
require 'faraday_middleware/response_middleware'
require 'tempfile'

module FaradayMiddleware
  # The parse CSV class
  class ParseCSV < FaradayMiddleware::ResponseMiddleware
    def call(request)
      @app.call(request).on_complete do |response|
        parse_csv(response, @options[:parser])
      end
    end

    def parse_csv(response, options)
      return unless response_type(response) =~ /\bcsv$/
      begin
        file = Tempfile.new('csv')
        file.write(response.body)
        file.close
        response.body = CSV.read(file.path, options)
      ensure
        file.unlink
      end
    end
  end
end

Faraday::Response.register_middleware csv: FaradayMiddleware::ParseCSV
