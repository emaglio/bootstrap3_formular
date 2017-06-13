class SessionsController < ApplicationController

  def new
    run Session::SignInForm
    render Session::Cell::SignIn, result["contract.default"]
  end

  def create
    run Session::SignIn do |result|
      tyrant.sign_in!(result["model"])
      return redirect_to "/users"
    end
    render Session::Cell::SignIn, result["contract.default"]
  end

  def sign_out
    run Session::SignOut do
      tyrant.sign_out!
      redirect_to "/sessions/new"
    end
  end
end
