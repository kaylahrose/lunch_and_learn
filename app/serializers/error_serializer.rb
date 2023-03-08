class ErrorSerializer
  def self.record_invalid(error)
    {
      errors: [
        {
          title: error.message,
          status: "400"
        }
      ]
    }
  end
end