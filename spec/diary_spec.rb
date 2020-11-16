require 'diary'

RSpec.describe Diary do
  it " can add entries to the diary array" do
    diary = Diary.new
    diary1 = { title: "First entry", content: "This is my first piece" }
    diary.add("First entry", "This is my first piece")
    expect(diary.view).to eq([diary1])

    diary2 = { title: "Second entry", content: "This is my second piece" }
    diary.add("Second entry", "This is my second piece")
    expect(diary.view).to eq([diary1, diary2])
  end
end