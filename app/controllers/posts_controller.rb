class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
def index
    @posts = Post.all
end

def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id

    if post.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to :action => "show", :id => post.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to action: :index
  end

  def wave
    @posts = Post.where(bone:"ウェーブ") #ここがポイント！categoryのバリューがdogの投稿を取得！
  end

  def straight
    @posts = Post.where(bone:"ストレート") #ここがポイント！categoryのバリューがcatの投稿を取得！
  end

  def natural
    @posts = Post.where(bone:"ナチュラル") #ここがポイント！categoryのバリューがhadakadebanezumiの投稿を取得！
  end

  def humei
    @posts = Post.where(bone:"不明") #ここがポイント！categoryのバリューがcatの投稿を取得！
  end

  private
  def post_params
    params.require(:post).permit(:height, :weight, :bone, :brand, :price, :about, :image)
  end

end
