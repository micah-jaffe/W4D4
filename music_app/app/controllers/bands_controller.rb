class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end
  
  def create
    band = Band.new(name: params[:band][:name])
    
    if band.save
      redirect_to bands_url
    else
      flash.now[:band] = "Your band sucks"
      render :new
    end
  end
  
  def new
    @band = Band.new
    render :new
  end
  
  def edit
    @band = Band.find(params[:id])
    render :edit
  end
  
  def show
    @band = Band.find(params[:id])
    render :show
  end
  
  def update
    band = Band.find(params[:id])
    
    if band.update_attributes(name: params[:band][:name])
      redirect_to band_url(band)
    else
      flash.now[:band] = "No chance, Lance"
      render :edit
    end
  end
  
  def destroy
    band = Band.find(params[:id])
    band.destroy
    redirect_to bands_url
  end
  
  private
  
  def band_params
    params.require(:band).permit(:name)
  end
end