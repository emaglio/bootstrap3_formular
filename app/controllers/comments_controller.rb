class CommentsController < ApplicationController

  # def index
  #   run Post::Index

  #   render Post::Cell::Index, result["model"]
  # end

  # def new
  #   run Post::New

  #   render Post::Cell::New, result["contract.default"]
  # end

  def create
    run Comment::Create do |result|
      return redirect_to user_post_path(id: params[:post_id])
    end

    @post = Post::Show.(id: params[:post_id])["model"]

    render Post::Cell::Show, result["contract.default"], post: @post
  end

  # def show
  #   run Post::Show


  #   render Post::Cell::Show, result["contract.default"]
  # end

end # class UserController
