module ApplicationHelper
	def is_namespace_admin
		begin
			return false if !(request.base_url && request.url)
			request.url.split(request.base_url)[1].split("/")[1] == "admin"
		rescue => error
			return false
		end
	end
  # def is_not_namespace_admin
  #   !is_namespace_admin
  # end
  def set_layout
   is_namespace_admin ? "admin" : "application"
  end
end
