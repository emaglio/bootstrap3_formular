class UsersController < ApplicationController

  def index
    run User::Index

    render User::Cell::Index, result["model"]
  end

  def new
    run User::New

    render User::Cell::New, result["contract.default"]
  end

  def create
    run User::Create do |result|
      tyrant.sign_in!(result["model"])
      return redirect_to "/users"
    end

    render User::Cell::New, result["contract.default"]
  end

end # class UserController
