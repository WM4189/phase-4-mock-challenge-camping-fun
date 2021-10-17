class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Camper.all
    end

    def show
        render json: Camper.find(params[:id]), serializer: CamperActivitiesSerializer
    end

    def create
        camper = Camper.new(camper_params)
        if camper.save
            render json: camper, status: :created
        else
            # render json: camper.errors, status: :unprocessable_entity
            render json: {
                "errors": ["validation errors"]
            }, status: :unprocessable_entity
        end
    end

    private
    def camper_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: { error: "Camper not found" }, status: :not_found
      end

end
