require 'rails_helper'

RSpec.describe 'Articles page', type: :feature do
  before(:each) do
    @fake_user = User.create(
      name: 'Mr Test',
      email: 'test@test.com',
      password: '123123'
    )
  end

  it 'should allow access from logged-in users' do
    sign_in @fake_user
    visit articles_path
    expect(current_path).to eq(articles_path)
  end

  it 'should redirect to the sign in page when user not logged-in' do
    visit articles_path
    expect(current_path).to eq(new_user_session_path)
  end

  it 'should have the title Articles' do
    sign_in @fake_user
    visit articles_path
    
    expect(page).to have_content('Articles')
  end

  it 'should display an empty message if there are no articles' do
    sign_in @fake_user
    visit articles_path
    
    expect(page).to have_content('No articles')
  end

  it 'should have a search bar' do
    sign_in @fake_user
    visit articles_path
    
    expect(page).to have_field('Search articles...')
    expect(page).to have_field('query')
  end

  it 'should have 5 visible articles' do
    @num_articles = 5
    
    titles = []
    body_texts = []
    
    @num_articles.times do |i|
      title = "Some title - #{i}"
      body = "#{Faker::Lorem.paragraph_by_chars(number: 50)} - #{i}"

      titles.push(title)
      body_texts.push(body)

      Article.create(
        title:,
        body:,
        user: @fake_user
      )
    end

    sign_in @fake_user
    visit articles_path

    @num_articles.times do |i|
      expect(page).to have_content(titles[i])
      expect(page).to have_content(body_texts[i])
    end
  end
end