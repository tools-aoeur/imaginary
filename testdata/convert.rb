ENV['THUMBNAIL_SERVICE_TOKEN'] = 'secret'
ENV['THUMBNAIL_SERVICE_URL']   = '10.212.0.1:8088'

require 'rest-client'
require 'active_support/all'
require 'optparse'

options = {}
auto_orient = false
operation = nil
width = nil
height = nil

opt_parser = OptionParser.new do |opts|
  # fake image magick like info in case some tool expects that kind of answer for parsing
  opts.version = <<~VERSION_INFO
    Version: imaginary 2023-08-23 https://github.com/tools-aoeur/imaginary
    Copyright: (C) 2023
    License: https://github.com/tools-aoeur/imaginary/blob/main/LICENSE
    Features: autorotate blur convert crop enlarge extract fit flip flop resize rotate smartcrop thumbnail watermark watermarkimage zoom
    Delegates (built-in): libvips
  VERSION_INFO

  opts.banner = "Usage: convert <options-input> input-file <options-output> output-file"

  opts.on('--auto-orient', 'Automatically rotate the image') do |v|
    auto_orient = v
  end

  opts.on('--thumbnail WIDTHxHEIGHT', 'Create a thumbnail') do |geometry|
    operation = :thumbnail
    width, height = geometry.split('x').map(&:to_i)
  end
end

positionals = opt_parser.parse!

# wraps access to the imaginary image processing microservice
class ImageProcessor
  def self.thumbnail(source, width, height, target, type='png')
    base_url = ENV.fetch('THUMBNAIL_SERVICE_URL', nil)
    raise 'Need URL to thumbnail service' if base_url.blank?

    service_secret = ENV.fetch('THUMBNAIL_SERVICE_TOKEN', nil)
    raise 'Need thumbnail service secret' if service_secret.blank?

    file = File.new(source, 'rb')
    url = "#{base_url}/fit?width=#{width}&height=#{height}&type=#{type}"
    raw_response = RestClient::Request.execute(
      method: :post,
      url: url,
      headers: { 'API-Key' => service_secret },
      payload: { file: file },
      raw_response: true
    )
    File.open(raw_response.file, 'rb') do |input_stream|
      File.open(target, 'wb') do |output_stream|
        IO.copy_stream(input_stream, output_stream)
      end
    end
  end
end

if operation == :thumbnail
  input_file, output_file, = positionals
  ImageProcessor.thumbnail(input_file, width, height, output_file)
else
  puts "No valid operation provided."
  exit 1
end
