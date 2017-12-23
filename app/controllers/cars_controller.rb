class CarsController < ApplicationController

	def index
		@cars = Car.search(params[:search])
	end

	def create
	  @car = Car.new(car_params)

      if @car.save
        render json: @car
      else
        render json: @car.errors, status: :unprocessable_entity
      end
    end

    def update
    	@car = Car.find(params[:id])
    	if @car.update(car_params)
    		render json: @car
    	else
    		render json: @car.errors, status: :unprocessable_entity
    	end
    end

    def destroy
    	@car = Car.find(params[:id])
    	@car.destroy
    	head :no_content
    end

    private
    def car_params
    	params.require(:car).permit(:name, :horsepower, :price, :model)
    end

end