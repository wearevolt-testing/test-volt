require 'rails_helper'

describe 'Posts API::V1 POST /create' do
  let(:user) { create(:user) }
  let(:access_token) { create(:access_token, resource_owner_id: user.id).token }
  it_behaves_like 'authorization_doorkeeper'

  let(:form_params) { {} }

  let(:subject) do
    post '/api/v1/posts', as: :json,
                          params: {
                            post: attributes_for(:post).merge(form_params),
                            access_token: access_token
                          }
  end

  it 'create new post' do
    expect { subject }.to change(Post, :count).by(1)
  end

  it 'return json' do
    subject
    expect(response.body).to include_json(
      title: attributes_for(:post)[:title],
      body: attributes_for(:post)[:body],
      author_nickname: user.nickname,
      id: be > 0,
      published_at: %r{^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.*}
    )
  end

  context 'invalide attributies' do
    %i[title body].each do |field|
      context "when without #{field}" do
        let(:form_params) { { field => nil } }
        it 'return status 422' do
          expect(subject).to eq 422
        end

        it 'return json with only error field' do
          subject
          json = JSON.parse(response.body)
          expect(json.size).to eq 1
          expect(json['errors']).not_to be_nil
        end
      end
    end
  end
end
