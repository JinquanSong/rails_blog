module Admin::MessagesHelper
  def message_weight(message)
    message.status ? 'font-weight:normal' : 'font-weight:bold'
  end

  def build_read_status_link(message)
    if message.status
      link_to 'Un-Read', admin_message_path(message, status: false), method: :put
    else
      link_to 'Read', admin_message_path(message, status: true), method: :put
    end
  end
end
