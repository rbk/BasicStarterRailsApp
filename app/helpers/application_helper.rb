module ApplicationHelper


	def show_notice notice
		if notice
			"<div class='notice alert alert-info'>#{notice}</div>".html_safe
		end
	end

end
