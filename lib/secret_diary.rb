class SecretDiary
  def initialize
    @entries = []
  end

  def add_entry(diary)
    @entries << diary
  end
end