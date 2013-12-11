require 'spec_helper'

describe PagesController do

  describe "GET 'search'" do
    it "returns http success" do
      get 'search'
      response.should be_success
    end
  end

  describe "GET 'result'" do
    it "returns http success" do
      get 'result'
      response.should be_success
    end
  end

end
