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
	
	@new_tree = Thing.new
  end
  def create
    verify_is_admin()
	params[:thing][:tree_attributes].delete :commit
	@tree = Thing.new(params[:thing])	
	
	respond_to do |format|
		if @tree.save
			format.html { redirect_to action: 'new', notice: 'User was successfully created.' }
			format.js   {}
			format.json { render json: @tree, status: :created, location: @user }
		else
			format.html { render action: "new" }
			format.json { render json: @tree.errors, status: :unprocessable_entity }
		end
	end
  end
  
  def show
  end
  
  def delete 
	#Params :id
    verify_is_admin()
  end
  
  def import
	verify_is_admin()
  end
end
