require 'rails_helper'

RSpec.describe 'Searches page', type: :feature do
  before(:each) do
    @fake_user = User.create(
      name: 'Mr Test',
      email: 'test@test.com',
      password: '123123'
    )
  end

  it 'should allow access from logged-in users' do
    sign_in @fake_user
    visit searches_path
    expect(current_path).to eq(searches_path)
  end

  it 'should redirect to the sign in page when user not logged-in' do
    visit searches_path
    expect(current_path).to eq(new_user_session_path)
  end

  it 'should have the title 0 Searches when the user has no searches' do
    sign_in @fake_user
    visit searches_path
    
    expect(page).to have_content('0 Searches')
  end

  it 'should display 5 searches' do
    @num_searches = 5
    @num_occurrences = 3
    
    queries = []
    
    @num_occurrences.times do
      @num_searches.times do |i|
        query = "query - #{i}"
  
        queries.push(query)
  
        Search.create(
          query:,
          user: @fake_user
        )
      end
    end

    sign_in @fake_user
    visit searches_path

    expect(page).to have_content(@num_occurrences)
    
    queries.each do |query|
      expect(page).to have_content(query)
    end
  end
end