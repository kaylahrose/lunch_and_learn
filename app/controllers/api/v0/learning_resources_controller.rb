class Api::V0::LearningResourcesController < ApplicationController
  def index
    resource = LearningResourceFacade.get_learning_resource(params[:country])
    render json: LearningResourceSerializer.new(resource)
  end
end