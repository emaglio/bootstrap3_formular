module Blog::Cell

  class Navigation < Trailblazer::Cell

    def current_user
      return options[:context][:current_user]
    end

    def nav
      render BootstrapVersion::Use == 3 ? :navigation_bootstrap3 : :navigation_bootstrap4
    end

    def welcome
      current_user.firstname.blank? ? "Hi, " + current_user.email : "Hi, " + current_user.firstname
    end

    def signed_in?
      return current_user != nil
    end

  end # class Navigation

end # module Blog::Cell
