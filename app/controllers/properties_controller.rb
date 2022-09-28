class PropertiesController < ApplicationController
  def index
    @properties = Property.all
    # if params[:query].present?
    #   @properties = Property.where("country LIKE ? OR city LIKE ?","%#{params[:query]}%", "%#{params[:query]}%")
    # else
    #   @properties = Property.all
    # end
      # Not too clean but it works!
    # if turbo_frame_request?
    #   render partial: "show", locals: { properties: @properties }
    # else
    #   render :index
    # end
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      respond_to do |format|
        # flash[:success] = "Object successfully created"
        format.html{redirect_to properties_url, notice: "Object successfully created"}
        format.turbo_stream {flash.now[:notice] = "Property successfully created"}
      end
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to properties_url
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def destroy 
    @property = Property.find(params[:id])
    if @property.destroy
      redirect_to properties_url
    else
      flash[:error] = "Something went wrong"
    end
  end

  def search
    if params[:query].present?
      @properties = Property.where("country LIKE ? OR city LIKE ?","%#{params[:query]}%", "%#{params[:query]}%")
    else
      @properties = []
    end
    respond_to do |format|
      format.turbo_stream do 
        render turbo_stream: turbo_stream.update("search_result", partial:"properties/search_results", local: {property: @property})
      end
    end
  end
  
  private
  
    def property_params
      params.require(:property).permit(:address, :street, :city, :country)
    end

  end
