module Api
  module V1
    class PostsController < BaseController
      def create
        @post = current_resource_owner.posts.create(post_params)
        respond_with :api, :v1, @post
      end

      private

      def post_params
        params.require(:post).permit(:title, :body, :published_at)
      end
    end
  end
end
