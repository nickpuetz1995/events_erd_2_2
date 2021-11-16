class Api::V1::RsvpStatusesController < Api::V1::GraphitiController
  def index
    rsvp_statuses = RsvpStatusResource.all(params)
    respond_with(rsvp_statuses)
  end

  def show
    rsvp_status = RsvpStatusResource.find(params)
    respond_with(rsvp_status)
  end

  def create
    rsvp_status = RsvpStatusResource.build(params)

    if rsvp_status.save
      render jsonapi: rsvp_status, status: 201
    else
      render jsonapi_errors: rsvp_status
    end
  end

  def update
    rsvp_status = RsvpStatusResource.find(params)

    if rsvp_status.update_attributes
      render jsonapi: rsvp_status
    else
      render jsonapi_errors: rsvp_status
    end
  end

  def destroy
    rsvp_status = RsvpStatusResource.find(params)

    if rsvp_status.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: rsvp_status
    end
  end
end
