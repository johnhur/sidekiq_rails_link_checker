require 'open-uri'
class LinksController < ApplicationController
  def show
  end

  def new
  	@site = Site.new

  end

  def create

  	@links = [] #empty array for the urls on the site
  	site = Site.create(site_params)
  	@site_url = site.url
  	# @request = Typhoeus.get(@site_url, followlocation: true)
 		
  	@doc = Nokogiri::HTML(open(@site_url))
  	@anchors = @doc.css("a")

  	# loop through the anchor tags and put all the urls into an array.
  	@anchors.each do |anchor|
  		if anchor.attr("href").include?("http") || anchor.attr("href").include?("https")
  		@links << anchor.attr("href")
  		LinksWorker.perform_async(anchor.attr("href"))
  		end 
  	end

  	# @doc.length
		

		# @x = Nokogiri::HTML(contents)



  end


  private
  def site_params
   params.require(:site).permit(:url)
  end

end
