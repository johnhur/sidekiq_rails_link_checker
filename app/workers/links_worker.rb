class LinksWorker
	include Sidekiq::Worker
	#avoid mutable variables here. 


	def perform(link_id)
		@request = Typhoeus.get(link_id, followlocation: true)
		json = JSON.parse @request.response_body
		
		snippet.update_attribute(:highlighted_code, request.body)
	end
end
