require 'rails_helper'

describe User do
  let(:user) { described_class.new(email: 'user@example.com') }

  it { is_expected.to respond_to(:email) }
  it { is_expected.to validate_presence_of(:nickname) }

  it "#email returns a string" do
    expect(user.email).to match 'user@example.com'
  end
end
