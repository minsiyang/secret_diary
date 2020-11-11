require "secret_diary"

RSpec.describe SecretDiary do
  context "user can add an entry" do
    it "adds the diary entry to an array" do
      secret_diary = SecretDiary.new
      diary = "This is my first piece"
      entries = [diary]
      expect(secret_diary.add_entry(diary)).to eq(entries)
    end
  end

  context "user can retrieve entries" do
    it "get added entries" do
      secret_diary = SecretDiary.new
      diary1 = "This is my first piece"
      diary2 = "This is my second piece"
      secret_diary.add_entry(diary1)
      secret_diary.add_entry(diary2)
      entries = [diary1, diary2]
      expect(secret_diary.get_entries).to eq(entries)
    end
  end
end