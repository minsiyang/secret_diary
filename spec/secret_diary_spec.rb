require "secret_diary"

RSpec.describe SecretDiary do

  context "user has to unlock the diary in order to use" do
    it "adds the diary entry to an array" do
      secret_diary = SecretDiary.new
      diary1 = { title: "First entry", content: "This is my first piece" }
      entries = [diary1]
      secret_diary.unlock
      expect(secret_diary.add_entry("First entry", "This is my first piece")).to eq(entries)

      diary2 = { title: "Second entry", content: "This is my second piece" }
      secret_diary.lock
      expect{ secret_diary.add_entry("Second entry", "This is my second piece") }.to raise_error("You need to unlock!")
    end

    it "get added entries" do
      secret_diary = SecretDiary.new
      diary1 = { title: "First entry", content: "This is my first piece" }
      diary2 = { title: "Second entry", content: "This is my second piece" }
      secret_diary.unlock
      secret_diary.add_entry("First entry", "This is my first piece")
      secret_diary.add_entry("Second entry", "This is my second piece")
      entries = [diary1, diary2]
      expect(secret_diary.get_entries).to eq(entries)

      secret_diary.lock
      expect{ secret_diary.get_entries }.to raise_error("You need to unlock!")
    end
  end

  context "user could not acces to the diary if it is locked" do
    it "could not add an diary entry" do
      secret_diary = SecretDiary.new
      diary1 = { title: "First entry", content: "This is my first piece" }
      expect{ secret_diary.add_entry("First entry", "This is my first piece") }.to raise_error("You need to unlock!")
    end

    it "could not get added entries" do
      secret_diary = SecretDiary.new
      diary1 = { title: "First entry", content: "This is my first piece" }
      diary2 = { title: "Second entry", content: "This is my second piece" }
      expect{ secret_diary.get_entries }.to raise_error("You need to unlock!")
    end
  end
end