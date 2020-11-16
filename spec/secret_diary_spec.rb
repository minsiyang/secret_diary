require "secret_diary"

RSpec.describe SecretDiary do

  context "user has to unlock the diary in order to use" do
    it "adds the diary entry to an array" do
      diary = instance_double("Diary")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(diary).to receive(:add).with("First entry", "This is my first piece")
      secret_diary.add_entry("First entry", "This is my first piece")
      
      secret_diary.lock
      expect(diary).not_to receive(:add).with("Second entry", "This is my second piece")
      expect{ secret_diary.add_entry("Second entry", "This is my second piece") }.to raise_error("You need to unlock!")
    end

    it "get added entries" do
      diary = instance_double("Diary")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      allow(diary).to receive(:add).with("First entry", "This is my first piece")
      secret_diary.add_entry("First entry", "This is my first piece")
      allow(diary).to receive(:add).with("Second entry", "This is my second piece")
      secret_diary.add_entry("Second entry", "This is my second piece")

      expect(diary).to receive(:view)
      secret_diary.get_entries

      secret_diary.lock
      expect{ secret_diary.get_entries }.to raise_error("You need to unlock!")
    end
  end

  context "user could not acces to the diary if it is locked" do
    it "could not add an diary entry" do
      diary = instance_double("Diary")
      secret_diary = SecretDiary.new(diary)
      expect(diary).not_to receive(:add).with("First entry", "This is my first piece")
      expect{ secret_diary.add_entry("First entry", "This is my first piece") }.to raise_error("You need to unlock!")
    end

    it "could not get added entries" do
      diary = instance_double("Diary")
      secret_diary = SecretDiary.new(diary)
      expect(diary).not_to receive(:add).with("First entry", "This is my first piece")
      expect(diary).not_to receive(:view)
      expect{ secret_diary.get_entries }.to raise_error("You need to unlock!")
    end
  end
end