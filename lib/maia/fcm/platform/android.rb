module Maia
  module FCM
    module Platform
      class Android
        def initialize(message)
          @message = message
        end

        def color
          @message.color
        end

        def sound
          @message.sound
        end

        def priority
          if @message.priority == :high
            :high
          else
            :normal
          end
        end

        def collapse_key
          @message.collapse_identifier
        end

        def to_h
          hash = {
            priority: priority.to_s,
            notification: {
              color: color,
              sound: sound
            }.compact
          }
          hash[:collapse_key] = collapse_key if collapse_key
          hash[:collapseKey] = collapse_key if collapse_key
          hash[:ttl] = @message.time_to_live if @message.respond_to? :time_to_live
          hash
        end
      end
    end
  end
end
