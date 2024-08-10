class ErrorHandlers < StandardError
  attr_reader :error,
              :status,
              :message,
              :title

  def initialize(
    error: nil,
    status: nil,
    title: nil,
    message: nil
  )

    @error = error
    @status = status || :unprocessable_entity
    @title = title || 'Something went wrong'
    @message = custom_message(message) || 'Something went wrong'
    super
  end

  def custom_message(msg)
    { title: @title, message: msg }
  end
end
