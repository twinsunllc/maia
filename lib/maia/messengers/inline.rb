module Maia
  module Messengers
    class Inline
      def deliver(payload, gateway: Maia.gateway)
        puts "Delivering #{payload} to #{gateway}"
        gateway.deliver payload
      rescue Maia::Error::Unregistered => e
        device = Maia::Device.find_by(token: e.token)
        device&.destroy
        raise
      end
    end
  end
end
