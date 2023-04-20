require 'rails_helper'

RSpec.describe Review, type: :model do

  # pending "add some examples to (or delete) #{__FILE__}"

  subject { Review.new(reviewer: "someone", review: "7", status: "private", student_id: "15") }

  describe "Association" do
    it { should belong_to(:student).without_validating_presence }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a reviewer" do
      subject.reviewer = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a review" do
      subject.review = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a status" do
      subject.status = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a student id" do
      subject.student_id = nil
      expect(subject).to_not be_valid
    end
  end
end