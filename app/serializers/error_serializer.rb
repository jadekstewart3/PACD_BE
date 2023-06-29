class ErrorSerializer
  def initialize(error)
    @error = error
  end

  def serialized_json
    { error: @error.message }
  end
end