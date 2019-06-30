class BulkEmployeeUploadChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "bulk_employee_upload_channel"
    stream_from "uploads:#{ params['upload_id'] }:status"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def notify
    ActionCable.server.broadcast "uploads:#{ params['upload_id'] }:status", message: "Connected...."
  end
end
