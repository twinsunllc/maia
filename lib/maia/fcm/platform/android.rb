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

        def collapse_key
          @message.collapse_identifier
        end

        def to_h
          notification_hash = {
            color: color,
            sound: sound
          }.compact
        
          android_hash = {}
          android_hash[:android_channel_id] = android_channel_id if android_channel_id
        
          hash = {
            priority: priority.to_s,
            notification: notification_hash
          }
          
          hash[:android] = android_hash unless android_hash.empty?
          hash[:collapse_key] = collapse_key if collapse_key
          hash[:ttl] = @message.time_to_live if @message.respond_to? :time_to_live
          
          hash
        end        
      end
    end
  end
end
