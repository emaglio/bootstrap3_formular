class PostsController < ApplicationController

  def index
    run Post::Index

    render Post::Cell::Index, result["model"]
  end

  def new
    run Post::Create::Present
    result["contract.default"].prepopulate!(user_email: tyrant.current_user.email) if tyrant.current_user

    render Post::Cell::New, result["contract.default"]
  end

  def create
    run Post::Create do |result|
      return redirect_to "/users/#{result["model"].user_id}/posts"
    end

    render Post::Cell::New, result["contract.default"]
  end

  def show
    @post = Post::Show.(params)["model"]
    run Comment::Create::Present

    render Post::Cell::Show, result["contract.default"], post: @post
  end

end # class UserController
