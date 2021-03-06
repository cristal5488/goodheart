class AnalyticsController < ApplicationController
  before_action :set_analytic, only: [:show, :edit, :update, :destroy]
  before_action :set_event

  # GET /analytics
  # GET /analytics.json
  def index
    @analytics = Analytic.all
  end

  # GET /analytics/1
  # GET /analytics/1.json
  def show
  end

  # GET /analytics/new
  def new
    @analytic = Analytic.new
  end

  # GET /analytics/1/edit
  def edit
  end

  # POST /analytics
  # POST /analytics.json
  def create
    @analytic = Analytic.new(analytic_params)
    @analytic.event_id = @event.id
    @analytic.health_provider_id = current_provider.id
    respond_to do |format|
      if @analytic.save!
        format.html { redirect_to event_path(@event.id), notice: 'BLOODTYPE was successfully added.' }
        format.json { render :show, status: :created, location: @analytic }
      else
        format.html { render :new }
        format.json { render json: @analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analytics/1
  # PATCH/PUT /analytics/1.json
  def update
    respond_to do |format|
      if @analytic.update(analytic_params)
        format.html { redirect_to event_path(@event.id), notice: 'Analytic was successfully updated.' }
        format.json { render :show, status: :ok, location: @analytic }
      else
        format.html { render :edit }
        format.json { render json: @analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analytics/1
  # DELETE /analytics/1.json
  def destroy
    @analytic.destroy
    respond_to do |format|
      format.html { redirect_to analytics_url, notice: 'Analytic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analytic
      @analytic = Analytic.find(params[:id])
    end

    def set_event
      @event = current_provider.events.find(params[:event_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analytic_params
      params.require(:analytic).permit(:bloodtype, :arrival_time)
    end
end
