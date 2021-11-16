require "rails_helper"

RSpec.describe RsvpStatusResource, type: :resource do
  describe "serialization" do
    let!(:rsvp_status) { create(:rsvp_status) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(rsvp_status.id)
      expect(data.jsonapi_type).to eq("rsvp_statuses")
    end
  end

  describe "filtering" do
    let!(:rsvp_status1) { create(:rsvp_status) }
    let!(:rsvp_status2) { create(:rsvp_status) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: rsvp_status2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([rsvp_status2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:rsvp_status1) { create(:rsvp_status) }
      let!(:rsvp_status2) { create(:rsvp_status) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      rsvp_status1.id,
                                      rsvp_status2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      rsvp_status2.id,
                                      rsvp_status1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
