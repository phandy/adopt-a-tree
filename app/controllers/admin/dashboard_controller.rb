class Admin::DashboardController < ApplicationController
  layout 'admin'
  def index
	verify_is_admin()
  end
  
  private
  
end
