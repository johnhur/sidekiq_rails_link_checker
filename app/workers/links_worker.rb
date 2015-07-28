class LinksWorker
	include Sidekiq::Worker
	#avoid mutable variables here. 


	def perform(link_id)
		#gets site from db #check links
		#iterates over all links
		#makes the request
		#saves response code 

		# snippet.update_attribute(:highlighted_code, request.body)
	end


end
