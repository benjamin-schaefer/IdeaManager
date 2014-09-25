module ApplicationHelper
	def show_image(obj, width: 100, height: 100)
		height ||= width
	 	return image_tag("question_mark.jpeg", width: width, height: height) unless obj
		return image_tag(obj.picture_url, width: width, height: height) if obj.respond_to?(:picture) && obj.picture.present?
		
		case obj
		when User
			image_tag("default_avatar.jpeg", width: width, height: height)
		when Idea
			image_tag("exclamation_mark.jpeg", width: width, height: height)
		else
			fail ArgumentError
		end
	end

	def format_date(date, format = :long_ordinal)
		I18n.l(date, format: format)

		#date.to_s(:long_ordinal)
		#date.strftime("%d").to_i.ordinalize + date.strftime(" %B %Y, %H:%M:%S")
	end
end
