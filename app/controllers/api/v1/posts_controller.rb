module Api
  module V1
    class PostsController < BaseController
      skip_before_action :doorkeeper_authorize!, only: %i[show index]

      before_action :load_post, only: [:show]

      rescue_from ActiveRecord::RecordNotFound, with: :show404

      def create
        @post = current_resource_owner.posts.create(post_params)
        respond_with :api, :v1, @post
      end

      def show
        respond_with :api, :v1, @post
      end

      def index
        @posts = Post.paginate(paginate_params).order('published_at DESC')
        respond_with :api, :v1, @posts
        # TODO: test for this action
      end

      private

      def post_params
        params.require(:post).permit(:title, :body, :published_at)
      end

      def load_post
        @post = Post.find(params[:id])
      end

      def show404
        render json: { errors: [I18n.t('post.not_found')]}, status: :not_found
      end

      def paginate_params
        {
          page:     params[:page] || 1,
          per_page: params[:per_page] || 30
        }
      end
    end
  end
end
