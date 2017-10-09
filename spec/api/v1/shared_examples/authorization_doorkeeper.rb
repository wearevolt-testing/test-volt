shared_examples 'authorization_doorkeeper' do |_opt|
  context 'unauthorized' do
    it 'returns 401 status if there is no access_token' do
      do_request
      expect(response.status).to eq 401
    end

    it 'returns 401 status if access_token is invalid' do
      do_request access_token: '123'
      expect(response.status).to eq 401
    end
  end

  context 'authorized' do
    it 'returns 200 status code' do
      do_request access_token: access_token.token
      expect(response).to be_success
    end
  end
end
