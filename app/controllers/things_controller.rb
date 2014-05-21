class ThingsController < ApplicationController
  respond_to :json

  def show
    @things = Thing.find_closest(params[:lat], params[:lng], params[:limit] || 10)
    unless @things.blank?
      respond_with @things
    else
      render(json: {errors: {address: [t("errors.not_found", thing: t("defaults.thing"))]}}, status: 404)
    end
  end

  def update
    # logger.info(params[:id])
    # logger.info(params[:tree])
    if params.has_key? :id
      @thing = Thing.find(params[:id])
    else
      @thing = Thing.find(request[:thing][:id])
    end
    if @thing.update_attributes(thing_params)
      flash[:notice] = "Thank you for your commitment!"
      redirect_to(root_path)
    else
      render(json: {errors: @thing.errors}, status: 500)
    end
  end

  private

  def thing_params
    params.require(:thing).permit(:name, :user_id)
  end
  
  def pledge
    @thing = Thing.find(params[:id])
  end
end
