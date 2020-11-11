class SecretDiary
  def initialize
    @entries = []
  end

  def add_entry(diary)
    @entries << diary
  end

  def get_entries
    @entries
  end
end