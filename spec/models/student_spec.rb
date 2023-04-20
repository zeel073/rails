require 'rails_helper'

RSpec.describe Student, type: :model do

  subject { Student.new(rollNo: "14", name: "someone", remarks: "Nice student", status: "archived",email: "hello@gmail.com" )}

  describe "associations of students" do
    it { should have_many(:reviews)}
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a rollNo" do
    subject.rollNo=nil
    expect(subject).to_not be_valid
  end

  describe "rollNo should be integer" do
    it {should validate_numericality_of(:rollNo).only_integer }
  end

  it "is not valid without an email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end

  describe "uniqueness of email" do
    it {should validate_uniqueness_of(:email)}
  end

  describe "min and max length of email" do
    it {should validate_length_of(:email).is_at_least(4)}
    it {should validate_length_of(:email).is_at_most(254)}
  end

  it "is not valid without remarks" do
    subject.remarks=nil
    expect(subject).to_not be_valid
  end

  describe "minimimum remark length is 10" do
    it {should validate_length_of(:remarks).is_at_least(10)}
  end

  it "is not valid without a name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end

  describe "minimimum name length is 2" do
    it {should validate_length_of(:name).is_at_least(2)}
  end

  it "is not valid without a status" do
    subject.status=nil
    expect(subject).to_not be_valid
  end

    describe "status should be included from that 3 elements" do
      it { should validate_inclusion_of(:status).in_array(%w[public private archived]) }
    end

end