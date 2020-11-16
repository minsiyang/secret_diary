class SecretDiary
  attr_reader :diary

  def initialize(diary = Diary.new)
    @diary = diary
    @locked = true
  end

  def add_entry(title, content)
    raise "You need to unlock!" if @locked
    diary.add(title, content)
  end

  def get_entries
    raise "You need to unlock!" if @locked
    diary.view
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end
end