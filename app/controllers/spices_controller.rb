class SpicesController < ApplicationController
    # GET /spices: return an array of all spices
    def index
        spices = Spice.all
        if spices
            render json: spices, status: :ok
        else
            render json: {error: "Could not get spices"}, status: :not_found
        end
    end

    #POST /spices: create a new spice
    def create
        spice = Spice.create(spice_params)
        if spice
            render json: spice, status: :created
        else
            render json: {error: "Could not create spice"}, status: :not_implemented
        end
    end

    # PATCH /spices/:id: update an existing spice
    def update
        spice = Spice.find_by(id: params[:id])
        if spice
           spice.update(spice_params)
           render json: spice, status: :ok
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end

    # DELETE /spices/:id: delete an existing spice
    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            head :no_content
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
