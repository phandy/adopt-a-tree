class Admin::DashboardController < ApplicationController
  layout 'admin'
  def index
	verify_is_admin()
  end
  
  private
  
	def verify_is_admin
		(current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
	end
end
