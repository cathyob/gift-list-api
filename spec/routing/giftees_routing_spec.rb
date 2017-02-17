require "rails_helper"

RSpec.describe GifteesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/giftees").to route_to("giftees#index")
    end

    it "routes to #new" do
      expect(:get => "/giftees/new").to route_to("giftees#new")
    end

    it "routes to #show" do
      expect(:get => "/giftees/1").to route_to("giftees#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/giftees/1/edit").to route_to("giftees#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/giftees").to route_to("giftees#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/giftees/1").to route_to("giftees#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/giftees/1").to route_to("giftees#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/giftees/1").to route_to("giftees#destroy", :id => "1")
    end

  end
end
