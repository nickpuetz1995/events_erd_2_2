require 'rails_helper'

RSpec.describe "rsvp_statuses#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/rsvp_statuses", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'rsvp_statuses',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(RsvpStatusResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { RsvpStatus.count }.by(1)
    end
  end
end
