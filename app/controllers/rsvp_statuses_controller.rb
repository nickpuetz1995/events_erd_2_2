class RsvpStatusesController < ApplicationController
  before_action :set_rsvp_status, only: %i[show edit update destroy]

  # GET /rsvp_statuses
  def index
    @q = RsvpStatus.ransack(params[:q])
    @rsvp_statuses = @q.result(distinct: true).includes(:user,
                                                        :event).page(params[:page]).per(10)
  end

  # GET /rsvp_statuses/1
  def show; end

  # GET /rsvp_statuses/new
  def new
    @rsvp_status = RsvpStatus.new
  end

  # GET /rsvp_statuses/1/edit
  def edit; end

  # POST /rsvp_statuses
  def create
    @rsvp_status = RsvpStatus.new(rsvp_status_params)

    if @rsvp_status.save
      message = "RsvpStatus was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @rsvp_status, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /rsvp_statuses/1
  def update
    if @rsvp_status.update(rsvp_status_params)
      redirect_to @rsvp_status, notice: "Rsvp status was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /rsvp_statuses/1
  def destroy
    @rsvp_status.destroy
    message = "RsvpStatus was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to rsvp_statuses_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rsvp_status
    @rsvp_status = RsvpStatus.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def rsvp_status_params
    params.require(:rsvp_status).permit(:event_id, :user_id, :rsvp_status)
  end
end
