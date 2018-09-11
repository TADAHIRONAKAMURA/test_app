class FishingSpotsController < ApplicationController
	def index
		@spots = FishingSpot.all
	end

	def new
		@spots = FishingSpot.all
		@spot = FishingSpot.new
	end

	def create
		@spot = FishingSpot.new(fishing_spot_params)
		@spot.save
		redirect_to new_fishing_spot_path
	end

	def show
		@spot = FishingSpot.find(params[:id])
		@f_reports = FishingReport.where(fishing_spot_id: @spot.id)
		@spots = FishingSpot.all
		@lure_types = LureType.all
		
	end
		

	def edit
		@spot = FishingSpot.find(params[:id])
	end

	def update
		@spot = FishingSpot.find(params[:id])
      	@spot.update(fishing_spot_params)
      	redirect_to new_fishing_spot_path(@spot.id)
    end


	def destroy
        @spot = FishingSpot.find(params[:id])
        @spot.destroy
        redirect_to new_fishing_spot_path
   	end

	private
	def fishing_spot_params
		params.require(:fishing_spot).permit(:fishing_spot_name, :fishing_spot_image, :fishing_spot_body)
		
	end


end

