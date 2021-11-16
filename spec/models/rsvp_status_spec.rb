require "rails_helper"

RSpec.describe RsvpStatus, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:event) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
