require "rails_helper"

RSpec.describe RsvpStatusResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "rsvp_statuses",
          attributes: {},
        },
      }
    end

    let(:instance) do
      RsvpStatusResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { RsvpStatus.count }.by(1)
    end
  end

  describe "updating" do
    let!(:rsvp_status) { create(:rsvp_status) }

    let(:payload) do
      {
        data: {
          id: rsvp_status.id.to_s,
          type: "rsvp_statuses",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      RsvpStatusResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { rsvp_status.reload.updated_at }
      # .and change { rsvp_status.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:rsvp_status) { create(:rsvp_status) }

    let(:instance) do
      RsvpStatusResource.find(id: rsvp_status.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { RsvpStatus.count }.by(-1)
    end
  end
end
