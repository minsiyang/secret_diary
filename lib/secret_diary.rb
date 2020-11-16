class SecretDiary
  def initialize
    @entries = []
    @locked = true
  end

  def add_entry(title, content)
    raise "You need to unlock!" if @locked
    @entries << { title: title, content: content }
  end

  def get_entries
    raise "You need to unlock!" if @locked
    @entries
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end
end