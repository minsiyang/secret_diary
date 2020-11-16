class SecretDiary
  def initialize
    @entries = []
    @locked = true
  end

  def add_entry(diary)
    raise "You need to unlock!" if @locked
    @entries << diary
  end

  def get_entries
    raise "You need to unlock!" if @locked
    @entries
  end

  def unlock
    @locked = false
  end
end