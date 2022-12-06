require 'rails_helper'

RSpec.describe Search, type: :model do
  subject do
    fake_user = User.new(
      name: 'Mr Test',
      email: 'test@test.com',
      password: '123123'
    )

    Search.new(
      query: 'hello world',
      user: fake_user
    )
  end

  before { subject.save }

  it 'should be valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'should NOT be valid without a query' do
    subject.query = nil
    expect(subject).to_not be_valid
  end
end
