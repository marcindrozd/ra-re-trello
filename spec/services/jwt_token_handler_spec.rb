require 'rails_helper'

describe JwtTokenHandler do
  subject { described_class }

  let(:payload) { { 'one' => 'two' } }
  let(:token) do
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJvbmUiOiJ0d28ifQ.LIQzHve5MXtn4ttBVq9jrnq5cICIratWmkB6qknUErw'
  end

  before do
    allow(Rails).to receive_message_chain(:application, :secrets, :secret_key_base).
      and_return('secret_key')
  end

  describe '.encode' do
    it { expect(subject.encode(payload)).to eq(token) }
  end

  describe '.decode' do
    it { expect(subject.decode(token)).to eq(payload) }
  end
end
