shared_examples 'authorization_doorkeeper' do |_opt|
  context 'unauthorized' do
    let(:access_token) { '' }
    it 'returns 401 status if there is no access_token' do
      expect(subject).to eq 401
    end

    it 'returns 401 status if access_token is invalid' do
      subject
      expect(subject).to eq 401
    end
  end

  context 'authorized' do
    it 'returns 200 status code' do
      subject
      expect(response).to be_success
    end
  end
end
