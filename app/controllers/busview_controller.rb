# -*- encoding: utf-8 -*-

require 'open-uri'
require 'nokogiri'

class BusviewController < ApplicationController
    def view
        @pages = []
        #doc = Nokogiri::HTML(open("http://www.google.com/search?q=doughnuts"))
        #doc = Nokogiri::HTML(open("http://www.tobu-bus.com/pc/search/s50on_index.php"))
        doc = Nokogiri::HTML(open("http://210.132.101.180/service/tobu/web_east/main02.jsp?wid=1&gid=410&scd=62498&s=62498&e=62396&k=&k2=&k3="))
        line = doc.xpath('//body').text
        line = line.split('小山小学校前')[2].gsub('©東武バス(株)', '')
        line = line.gsub('前', '前<br>')
        line = line.gsub('↑', '↑<br>')
        @page = line

        #@page = line.split('６つ前')[0]
    end
end
