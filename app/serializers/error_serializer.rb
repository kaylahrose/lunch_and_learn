class ErrorSerializer
  def self.active_record_error(message, code)
    {
      errors: [
        {
          title: message,
          status: code
        }
      ]
    }
  end
end