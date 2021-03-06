class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  before_action :validates_is_health_provider, only: [:new, :update, :edit, :create, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = current_provider.events
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = current_provider.events.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_provider.events.new(event_params)

    respond_to do |format|
      if @event.save
        begin
          message_sender = MessageSender.new
          message_sender.send_messages(@event)
        rescue Twilio::REST::RequestError
          # fail silently
        ensure
          format.html { redirect_to @event, notice: 'Event was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        end

      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event  updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Event destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      if current_provider
        @event = current_provider.events.find(params[:id])
      else
        @event = Event.find(params[:id])
      end
    end

    def validates_is_health_provider
      redirect_to root_path unless current_provider
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit( :event_name, :date, :start_time, :end_time, :description, :address, :zipcode, :bloodtype)
    end
end
