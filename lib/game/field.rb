class Field
  def initialize(value)
    @id = SecureRandom.uuid
    @value = value
  end
end
