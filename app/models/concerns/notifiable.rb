module Notifiable
  extend ActiveSupport::Concern

  included do
    after_save :notify

    def notify
      notifications.build.save
    end
  end
end