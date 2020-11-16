class Diary
  def initialize
    @entries = []
  end

  def add(title, content)
    @entries << { title: title, content: content }
  end

  def view
    @entries
  end
end