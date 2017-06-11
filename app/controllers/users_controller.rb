class UsersController < ApplicationController

  def index
    run User::Index

    render User::Cell::Index, result["model"]
  end

end # class UserController
