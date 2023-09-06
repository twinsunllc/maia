module Maia
  module Error
    class Unregistered < Generic
      def token
        json = JSON.parse(payload)
        json.dig('message', 'token')
      rescue JSON::ParserError
        nil
      end
    end
  end
end
