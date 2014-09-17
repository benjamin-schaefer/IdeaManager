module ApplicationHelper
	def show_image(obj, width: 100)
		return unless obj
		image_tag(obj.picture_url, width: width) if obj.picture.present?
	end

	def format_date(date)
		
	end
end
