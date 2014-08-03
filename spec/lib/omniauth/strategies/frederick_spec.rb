require 'spec_helper'

describe OmniAuth::Strategies::Frederick do
  let(:frederick) { OmniAuth::Strategies::Frederick.new('client_id', 'client_secret') }
  let(:raw_info) { {
    'email' => 'friends@hirefrederick.com',
    'first_name' => 'First',
    'last_name' => 'Last',
    'id' => 'theId',
    'business_id' => 'theBizId',
    'is_consumer_only' => false
  } }

  it 'has the correct options' do
    expect(frederick.options.client_options.site).to eq 'https://hirefrederick.com'
    expect(frederick.options.client_options.authorize_url).to eq '/oauth/authorize'
  end

  describe '#info' do
    before do
      expect(frederick).to receive(:raw_info).exactly(5).times.and_return(raw_info)
    end

    it 'maps the raw_info things to info and uid' do
      expect(frederick.info).to eq({
        :email => raw_info["email"],
        :first_name => raw_info["first_name"],
        :last_name => raw_info["last_name"],
        :business_id => raw_info["business_id"],
        :is_consumer_only => raw_info["is_consumer_only"]
      })
    end
  end

  describe '#uid' do
    before do
      expect(frederick).to receive(:raw_info).and_return(raw_info)
    end

    it 'maps the raw_info id to uid' do
      expect(frederick.uid).to eq raw_info["id"]
    end
  end

  describe '#raw_info' do
    let(:access_token) { double('OAuth2::AccessToken', :options => {}) }
    let(:response) { double('OAuth2::Response') }

    before do
      expect(frederick).to receive(:access_token).and_return(access_token)
    end

    it 'calls access_token.get with the correct path' do
      expect(response).to receive(:parsed).and_return('the_response')
      expect(access_token).to receive(:get).with('/api/v1/users/me').and_return(response)
      expect(frederick.raw_info).to eq 'the_response'
    end
  end
end
