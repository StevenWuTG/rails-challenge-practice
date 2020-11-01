class BuildingsController < ApplicationController

    def index
        @buildings = Building.all
        render :index
    end
    
    def show
        @building = Building.find(params[:id])
        @uniq_comp = @building.uniq_companies
        render :show
    end

    def new
        @building = Building.new
        render :new
    end

    def edit
        @building = Building.find(params[:id])
        render :edit
    end
    
    def create
        @building = Building.create(building_params)
        redirect_to building_path(@building)
    end

    def update
        @building = Building.find(params[:id])
        @building.update(building_params)
        redirect_to building_path(@building)
    end


    private

    def building_params
        params.require(:building).permit(:name, :country, :address, :rent_per_floor, :number_of_floors)
    end



end