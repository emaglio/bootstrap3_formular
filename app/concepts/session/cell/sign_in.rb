module Session::Cell
  class SignIn < Trailblazer::Cell
    include Formular::RailsHelper

    def bootstrap
      BootstrapVersion::Use == 3 ? :bootstrap3 : :bootstrap4
    end
  end
end
