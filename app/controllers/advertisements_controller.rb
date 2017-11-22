class AdvertisementsController < ApplicationController
  def index
  	@advertisements = Advertisements.all
  end

  def show
  	@advertisements = Advertisements.find(params[:id])
  end

  def new
  	@advertisements = Advertisements.new
  end

  def create
  	@advertisements = Advertisements.new
  	@advertisements.title = params[:advertisements][:title]
  	@advertisements.copy = params[:advertisements][:copy]
  	@advertisements.price = params[:advertisements][:price]

  	if @advertisements.save
  		flash[:notice] = "Advertisement was saved"
  		redirect_to @advertisement
  	else
  		flash[:error] = "There was an error. Please try again"
  		render :new
  	end
  	
  end
end
