require 'rails_helper'

RSpec.describe "rsvp_statuses#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/rsvp_statuses/#{rsvp_status.id}", payload
  end

  describe 'basic update' do
    let!(:rsvp_status) { create(:rsvp_status) }

    let(:payload) do
      {
        data: {
          id: rsvp_status.id.to_s,
          type: 'rsvp_statuses',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(RsvpStatusResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { rsvp_status.reload.attributes }
    end
  end
end
