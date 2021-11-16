require "rails_helper"

RSpec.describe "rsvp_statuses#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rsvp_statuses", params: params
  end

  describe "basic fetch" do
    let!(:rsvp_status1) { create(:rsvp_status) }
    let!(:rsvp_status2) { create(:rsvp_status) }

    it "works" do
      expect(RsvpStatusResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["rsvp_statuses"])
      expect(d.map(&:id)).to match_array([rsvp_status1.id, rsvp_status2.id])
    end
  end
end
