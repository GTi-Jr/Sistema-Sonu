class SonuEventsController < ApplicationController

 before_action :authenticate_admin!, except: [:show]
 before_action :set_sonu_event, only: [:show, :edit, :update, :destroy]
  #authorize_resource 
 load_and_authorize_resource

        # GET /sonu_events
 
  # GET /sonu_events.json
  def index
    @sonu_events = SonuEvent.all
  end

  # GET /sonu_events/1
  # GET /sonu_events/1.json
  def show
  end

  # GET /sonu_events/new
  def new
    @sonu_event = SonuEvent.new
  end

  # GET /sonu_events/1/edit
  def edit
  end

  # POST /sonu_events
  # POST /sonu_events.json
  def create
    @sonu_event = SonuEvent.new(sonu_event_params)

    respond_to do |format|
      if @sonu_event.save
        format.html { redirect_to @sonu_event, notice: 'Sonu event was successfully created.' }
        format.json { render :show, status: :created, location: @sonu_event }
      else
        format.html { render :new }
        format.json { render json: @sonu_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sonu_events/1
  # PATCH/PUT /sonu_events/1.json
  def update
    respond_to do |format|
      if @sonu_event.update(sonu_event_params)
        format.html { redirect_to @sonu_event, notice: 'Sonu event was successfully updated.' }
        format.json { render :show, status: :ok, location: @sonu_event }
      else
        format.html { render :edit }
        format.json { render json: @sonu_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sonu_events/1
  # DELETE /sonu_events/1.json
  def destroy
    @sonu_event.destroy
    respond_to do |format|
      format.html { redirect_to sonu_events_url, notice: 'Sonu event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sonu_event
      @sonu_event = SonuEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sonu_event_params
      params.require(:sonu_event).permit(:name, :info)
    end
end
