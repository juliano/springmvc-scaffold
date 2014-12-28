require 'net/http'

module SpringMvcScaffold

  class Downloader
    def self.open_session(url)
      Net::HTTP.start(url)
    end
  end

end
