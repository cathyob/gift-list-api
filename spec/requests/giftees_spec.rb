require 'rails_helper'

RSpec.describe "Giftees", type: :request do
  describe "GET /giftees" do
    it "works! (now write some real specs)" do
      get giftees_path
      expect(response).to have_http_status(200)
    end
  end
end
