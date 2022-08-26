require "rails_helper"

RSpec.describe "routes for Quotes", type: :routing do
  it "routes / to quotes controller index action" do
    expect(get("/")).to route_to("quotes#index")
  end
  it "routes /quotes to quotes controller index action" do
    expect(get("/quotes")).to route_to(controller: "quotes", action: "index")
  end
  it "routes /quotes.json to quotes controller index action" do
    expect(get("/quotes.json")).to route_to(controller: "quotes", action: "index", format: "json")
  end
  it "routes /quotes.xml to quotes controller index action" do
    expect(get("/quotes.xml")).to route_to(controller: "quotes", action: "index", format: "xml")
  end
end