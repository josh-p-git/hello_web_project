require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET AND POST tests" do
    it "returns 200 OK with the right content" do

      response = get("/names")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  
    it "returns 200 OK with the right content in alphabetical order" do

        response = post("/sort-names", name: "Joe,Alice,Zoe,Julia,Kieran")
  
        # Assert the response status code and body.
        expect(response.status).to eq(200)
        expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
  end

  context "HTML tests" do
    it "returns HTML with 'Hello!' in the body" do
      response = get("/hello")

      expect(response.body).to include('<h1>Hello!</h1>')
    end
  end
end