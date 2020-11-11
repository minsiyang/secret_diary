require "secret_diary"

RSpec.describe SecretDiary do

  context "user has to unlock the diary in order to use" do
    it "adds the diary entry to an array" do
      secret_diary = SecretDiary.new
      diary = "This is my first piece"
      entries = [diary]
      secret_diary.unlock
      expect(secret_diary.add_entry(diary)).to eq(entries)
    end

    it "get added entries" do
      secret_diary = SecretDiary.new
      diary1 = "This is my first piece"
      diary2 = "This is my second piece"
      secret_diary.unlock
      secret_diary.add_entry(diary1)
      secret_diary.add_entry(diary2)
      entries = [diary1, diary2]
      expect(secret_diary.get_entries).to eq(entries)
    end
  end

  context "user could not acces to the diary if it is locked" do
    it "could not add an diary entry" do
      secret_diary = SecretDiary.new
      diary = "This is my first piece"
      expect(secret_diary.add_entry(diary)).to eq("You need to unlock!")
    end

    it "could not get added entries" do
      secret_diary = SecretDiary.new
      diary1 = "This is my first piece"
      diary2 = "This is my second piece"
      expect(secret_diary.get_entries).to eq("You need to unlock!")
    end
  end
end