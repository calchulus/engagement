require 'spec_helper'

describe Engagement::CommentCounter::Twitter do

  if twitter_credentials_present?
    let(:counter) { Engagement::CommentCounter::Twitter.new(twitter_credentials) }
    let(:url) { 'https://teamgaslight.com/blog/6-ways-to-remove-pain-from-feature-testing-in-ruby-on-rails' }

    it 'returns the number of comments for the given url', :vcr do
      expect(counter.comments_count(url)).to eq(1)
    end
  else
    puts 'Skipping Twitter test, please set the TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET, TWITTER_OAUTH_TOKEN, TWITTER_OAUTH_TOKEN_SECRET environment variables.'
  end
end
