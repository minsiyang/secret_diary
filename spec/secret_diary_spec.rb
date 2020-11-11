require "secret_diary"

RSpec.describe SecretDiary do
  context "it can add an entry" do
    it "adds the diary entry to an array" do
      secret_diary = SecretDiary.new
      diary = "This is my first piece"
      entries = [diary]
      expect(secret_diary.add_entry(diary)).to eq(entries)
    end
  end
end