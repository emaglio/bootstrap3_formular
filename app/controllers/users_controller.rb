class UsersController < ApplicationController

  def index
    run User::Index

    render User::Cell::Index, result["model"]
  end

  def new
    run User::New

    render User::Cell::New, result["contract.default"]
  end

end # class UserController
