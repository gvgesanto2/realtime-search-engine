require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    @max_name_length = 100

    User.new(
      name: 'Mr Test',
      email: 'test@test.com',
      password: '123123'
    )
  end

  before { subject.save }

  it 'should be valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'should NOT be valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should NOT be valid with a name longer than 100 characters' do
    subject.name = Faker::Lorem.paragraph_by_chars(number: @max_name_length + 1)
    expect(subject).to_not be_valid
  end

  it 'should NOT be valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'should NOT be valid with an invalid email' do
    subject.email = 'invalid_email'
    expect(subject).to_not be_valid
  end
end
