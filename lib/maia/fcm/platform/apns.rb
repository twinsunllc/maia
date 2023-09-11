module Maia
  module FCM
    module Platform
      class APNS
        def initialize(message)
          @message = message
        end

        def badge
          @message.badge
        end

        def sound
          @message.sound
        end

        def priority
          if @message.priority == :high && !@message.background?
            10
          else
            5
          end
        end

        def collapse_id
          @message.collapse_identifier
        end

        def to_h
          {
            headers: {
              'apns-priority': priority.to_s,
              'apns-collapse-id': collapse_id
            }.compact,
            payload: {
              aps: {
                badge: badge,
                sound: sound,
                'content-available': (1 if @message.background?)
              }.compact
            }
          }
        end
      end
    end
  end
end
