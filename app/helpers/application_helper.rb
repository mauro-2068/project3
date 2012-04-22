module ApplicationHelper

	#Return a title on a per-page basis.
	def title
	  base_title = "Bookmarks Sample App"
	  if @title.nil?
		base_title
	  else
		"#{base_title} | #{@title}"
      end
	end

	def logo
	  image_tag("book_logo.jpg", :alt => "Bookmarks Logo", :class => "round", :id => "logo")    
	end
end
