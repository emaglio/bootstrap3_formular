class PostsController < ApplicationController

  def index
    run Post::Index

    render Post::Cell::Index, result["model"]
  end

  def new
    run Post::New

    render Post::Cell::New, result["contract.default"]
  end

  def create
    run Post::Create do |result|
      return redirect_to "/Posts"
    end

    render Post::Cell::New, result["contract.default"]
  end

end # class UserController
