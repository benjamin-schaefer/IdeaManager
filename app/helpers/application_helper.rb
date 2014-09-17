module ApplicationHelper
	def show_image(obj, width: 100)
	 	return image_tag("question_mark.jpeg", width: width) unless obj
		return image_tag(obj.picture_url, width: width) if obj.respond_to?(:picture) && obj.picture.present?
		
		case obj
		when User
			image_tag("default_avatar.jpeg", width: width)
		when Idea
			image_tag("exclamation_mark.jpeg", width: width)
		else
			fail ArgumentError
		end
	end

	def format_date(date)
		date.to_s(:long_ordinal)
		#date.strftime("%d").to_i.ordinalize + date.strftime(" %B %Y, %H:%M:%S")
	end
end
