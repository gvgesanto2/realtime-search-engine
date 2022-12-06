require 'rails_helper'

RSpec.describe Article, type: :model do
  subject do
    @min_body_length = 50
    @max_body_length = 5000
    @max_title_length = 100

    fake_user = User.new(
      name: 'Mr Test',
      email: 'test@test.com',
      password: '123123'
    )

    Article.new(
      title: 'Some title',
      body: Faker::Lorem.paragraph_by_chars(number: @min_body_length),
      user: fake_user
    )
  end

  before { subject.save }

  it 'should be valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'should NOT be valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'should NOT be valid with a title longer than 100 characters' do
    subject.title = Faker::Lorem.paragraph_by_chars(number: @max_title_length + 1)
    expect(subject).to_not be_valid
  end

  it 'should NOT be valid without a body' do
    subject.body = nil
    expect(subject).to_not be_valid
  end

  it 'should NOT be valid with a body shorter than 50 characters' do
    subject.body = Faker::Lorem.paragraph_by_chars(number: @min_body_length - 1)
    expect(subject).to_not be_valid
  end

  it 'should NOT be valid with a body longer than 5000 characters' do
    subject.body = Faker::Lorem.paragraph_by_chars(number: @max_body_length + 1)
    expect(subject).to_not be_valid
  end
end
