class Admin::UsersController < ApplicationController
  layout 'admin'
  respond_to :json

  def index
	verify_is_admin()
	
    @users = User.order('id')
 
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @users }
    end
  end
  
  def export
    verify_is_admin()
    @users = User.order('id')
	respond_to do |format|
      format.csv {send_data @users.as_csv}
	end
  end

end
