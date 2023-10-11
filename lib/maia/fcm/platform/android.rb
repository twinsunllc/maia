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

        def channel_id
          @message.channel_id
        end

        def tag
          @message.tag
        end

        def collapse_key
          @message.collapse_key
        end

        def to_h
          hash = {
            priority: priority.to_s,
            collapse_key: collapse_key
          }
          hash[:ttl] = @message.time_to_live if @message.respond_to? :time_to_live
          hash
        end
      end
    end
  end
end
