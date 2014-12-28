require 'spec_helper'

describe SpringMvcScaffold::Downloader do

  context "open session" do
    it "opens a http session" do
      http_request = double(Net::HTTP)
      expect(Net::HTTP).to receive(:start).and_return(http_request)

      http = described_class.open_session "http://any_url/here"
      expect(http).to be http_request
    end
  end
  
end
