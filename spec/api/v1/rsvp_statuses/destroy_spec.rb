require 'rails_helper'

RSpec.describe "rsvp_statuses#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/rsvp_statuses/#{rsvp_status.id}"
  end

  describe 'basic destroy' do
    let!(:rsvp_status) { create(:rsvp_status) }

    it 'updates the resource' do
      expect(RsvpStatusResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { RsvpStatus.count }.by(-1)
      expect { rsvp_status.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
