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

        def android_channel_id
          @message.android_channel_id
        end

        def android_tag
          @message.android_tag
        end

        def collapse_key
          @message.collapse_identifier
        end

        def to_h
          hash = {
            priority: priority.to_s,
            collapse_key: collapse_key,
            notification: {
              color: color,
              sound: sound,
              channel_id: android_channel_id,
              tag: android_tag,
            }.compact
          }
          hash[:ttl] = @message.time_to_live if @message.respond_to? :time_to_live
          hash
        end
      end
    end
  end
end
