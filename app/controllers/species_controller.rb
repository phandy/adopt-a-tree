class SpeciesController < ApplicationController
  respond_to :json, :xml

  def show
    if params[:edible] == "true"
      @species = Species.where("edible = true").order("name").all #.find(:all)
    else
      @species = Species.all #.find(:all)
    end
    unless @species.blank?
      speciesName = []
      for s in @species
        speciesName << s.name
      end
      respond_with speciesName
    else
      render(json: {errors: {address: [t("errors.not_found", thing: t("defaults.thing"))]}}, status: 404)
    end
  end

end
