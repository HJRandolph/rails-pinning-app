class PinsController < ApplicationController
  
  def index
    @pins = Pin.all
  end
  
  def show_by_name
  	@pin = Pin.find_by_slug(params[:slug])
  	render :show
  end
  
  
  def show
    @pin = Pin.find(params[:id])
  end
  
  
 def new
 	@pin = Pin.new
 end 
 
 def create
 	@pin = Pin.new(pin_params)
 	if @pin.valid?
 		@pin.save
#	 	redirect_to pin_by_name_path(@pin.slug)
	 	redirect_to @pin
 	else 
		@errors = @pin.errors
		render :new
	end

 end

 
 def edit
 	@pin = Pin.find_by_id(params[:id])
 end
 
 def edit_by_name
 	@pin = Pin.find_by_slug(params[:slug])
 	render :edit
 end
 
 def update
 	@pin = Pin.find_by_id(params[:id])
 	@pin.update_attributes(pin_params)
 	if @pin.valid?
	 	redirect_to pin_by_name_path(@pin.slug)
	 	#redirect_to pin_path
 	else
 		@errors = @pin.errors
 		render :edit
 	end
 	
end
 
 # Everything after this line is private
 private
 
 	def pin_params
 		params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image) 
 	end
 
end

