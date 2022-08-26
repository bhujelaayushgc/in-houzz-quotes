require 'rails_helper'

RSpec.describe "Quotes", type: :request do
  describe "GET /index" do
    it "returns html response: quotes" do
      get quotes_path

      expect(response.content_type).to match("text/html")
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end

    it "returns json response: quotes.json" do
      get "#{quotes_path}.json"
      json_response = JSON.parse(response.body)
      
      expect(response.content_type).to match("application/json")
      expect(response).to have_http_status(:ok)
      expect(json_response.has_key?("title")).to be_truthy
      expect(json_response.has_key?("author")).to be_truthy
      
    end

    it "returns json response: quotes.json" do
      get "#{quotes_path}.xml"
      xml_object = Hash.from_xml(response.body)["hash"]

      expect(xml_object.has_key?("title")).to be_truthy
      expect(xml_object.has_key?("author")).to be_truthy
      expect(response.content_type).to match("application/xml")
      expect(response).to have_http_status(:ok)
    end
  end
end
