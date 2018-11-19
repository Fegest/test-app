class PostsController < ApplicationController
  http_basic_authenticate_with name: "admin" , password: "123",
    except: [:index]

  def index

  end
  def work
    @post = Post.all
  end
  def new
    @post = Post.new
  end
  def show
    @post = Post.find(params[:id])
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])

    if (@post.update(post_params))
      redirect_to @post
    else
      render 'new'
    end
  end
  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to posts_work_path
  end
  def create
    #render plain: params[:post].inspect
    @post = Post.new(post_params)

    if (@post.save)
      redirect_to @post
    else
      render 'new'
    end
  end
  private def post_params
    params.require(:post).permit(:title,:priorit,:pay_date,:body)
  end

end
