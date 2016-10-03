require 'open-uri'
require 'nokogiri'
require 'openssl'

def wiki(num)
  result = []
  num.times do |i|
    charset = nil
    url = 'https://ja.wikipedia.org/wiki/%E7%89%B9%E5%88%A5:%E3%81%8A%E3%81%BE%E3%81%8B%E3%81%9B%E8%A1%A8%E7%A4%BA'
    html = open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE) do |f|
      charset = f.charset
      f.read
    end
    doc = Nokogiri::HTML.parse(html, nil, charset)
    doc.title =~ /\w*(?= - Wikipedia)/
    result << $`
    print "*"
  end
  puts ""
  puts result
end

wiki 5
