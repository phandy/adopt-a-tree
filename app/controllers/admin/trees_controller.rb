class Admin::TreesController < ApplicationController
  layout 'admin'
  respond_to :json

  def index
	verify_is_admin()
	
    @trees = Tree.order('id').page(params[:page]).per(50)
 
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @trees }
    end
  end
  
  def new
	verify_is_admin()
  end
  
  def delete 
	#Params :id
    verify_is_admin()
  end
  
  def import
	verify_is_admin()
  end
  
end
