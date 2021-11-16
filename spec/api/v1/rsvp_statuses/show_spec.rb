require 'rails_helper'

RSpec.describe "rsvp_statuses#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rsvp_statuses/#{rsvp_status.id}", params: params
  end

  describe 'basic fetch' do
    let!(:rsvp_status) { create(:rsvp_status) }

    it 'works' do
      expect(RsvpStatusResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('rsvp_statuses')
      expect(d.id).to eq(rsvp_status.id)
    end
  end
end
