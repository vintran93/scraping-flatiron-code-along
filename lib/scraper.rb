require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
# doc.css(".post").first.css("h2").text 
# doc.css(".post").first.css(".date").text
# doc.css(".post").first.css("p").text 

#The page itself:
#doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
#The collection of course offerings:
#doc.css(".post")
#The title of an individual course offering:
#doc.css(".post").first.css("h2").text
#The schedule of an individual course offering:
#doc.css(".post").first.css(".date").text
#The description of an individual course offering:
#doc.css(".post").first.css("p").text

  def get_page
      doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

      #doc.css(".post").each do |post|
        #course = Course.new
        #course.title = post.css("h2").text
        #course.schedule = post.css(".date").text
        #course.description = post.css("p").text
      #end
     
  end
  
  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
  end 

end


