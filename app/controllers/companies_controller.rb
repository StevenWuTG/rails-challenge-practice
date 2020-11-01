class CompaniesController < ApplicationController

    def index
        @companies = Company.all
        render :index
    end

    def show
        @company = Company.find(params[:id])
        @employee = Employee.new
        @employees = @company.employees
        #byebug
        render :show
    end

    def new
        @company = Company.new

        # @company.offices.build(:building_id,@company.id)
        render :new
    end

    def create
        #byebug
        @company = Company.new(company_params)
        
        if @company.save
            params[:company][:offices_attributes].each do |key, building_data|
                building = Building.find(building_data[:id])

                if building
                    floors = building_data[:offices]

                    floors.each do |floor|
                        if !floor.empty?
                            Office.create!(building: building, company: @company, floor: floor)
                        end
                    end
                end
            end
            redirect_to @company
        end
    end
    
    def edit
        @company = Company.find(params[:id])
        render :edit
    end
    private

    def company_params
        params.require(:company).permit(:name)
    end

    # def office_params
    #     params.require(:office).permit(:building_id, :company_id, :floor)
    # end

end