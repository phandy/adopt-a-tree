class Admin::TreesController < ApplicationController
  layout 'admin'
  respond_to :json

  def index
	verify_is_admin()
  end

end
