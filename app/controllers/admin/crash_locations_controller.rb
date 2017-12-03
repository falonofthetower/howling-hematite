class Admin::CrashLocationsController < AdminController
  before_action :set_crash_location, only: [:show, :edit, :update, :destroy]

  # GET /crash_locations
  # GET /crash_locations.json
  def index
    @crash_locations = CrashLocation.all
    gon.locations = retrieve_locations
  end

  # GET /crash_locations/1
  # GET /crash_locations/1.json
  def show
  end

  # GET /crash_locations/new
  def new
    @crash_location = CrashLocation.new
  end

  # GET /crash_locations/1/edit
  def edit
  end

  # POST /crash_locations
  # POST /crash_locations.json
  def create
    @crash_location = CrashLocation.new(crash_location_params)

    respond_to do |format|
      if @crash_location.save
        format.html { redirect_to [:admin, @crash_location], notice: 'Crash location was successfully created.' }
        format.json { render :show, status: :created, location: @crash_location }
      else
        format.html { render :new }
        format.json { render json: @crash_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crash_locations/1
  # PATCH/PUT /crash_locations/1.json
  def update
    respond_to do |format|
      if @crash_location.update(crash_location_params)
        format.html { redirect_to [:admin, @crash_location], notice: 'Crash location was successfully updated.' }
        format.json { render :show, status: :ok, location: @crash_location }
      else
        format.html { render :edit }
        format.json { render json: @crash_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crash_locations/1
  # DELETE /crash_locations/1.json
  def destroy
    @crash_location.destroy
    respond_to do |format|
      format.html { redirect_to crash_locations_url, notice: 'Crash location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crash_location
      @crash_location = CrashLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crash_location_params
      params.require(:crash_location).permit(:lat, :lng, :title, :content, :url_address, :url_title, :date)
    end

    def retrieve_locations
      CrashLocation.all
        .to_map_objects
        .map { |l| l.to_json }
    end
end
