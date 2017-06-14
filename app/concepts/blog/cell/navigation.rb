module Blog::Cell

  class Navigation < Trailblazer::Cell
    def current_user
      return options[:context][:current_user]
    end

    def welcome
      current_user.firstname.blank? ? "Hi, " + current_user.email : "Hi, " + current_user.firstname
    end

    def signed_in?
      return current_user != nil
    end

    def main_nav_id
      BootstrapVersion::Use == 3 ? "notId" : "mainNav"
    end

    def main_nav
      BootstrapVersion::Use == 3 ? "navbar navbar-default navbar-custom navbar-fixed-top" : "navbar fixed-top navbar-toggleable-md navbar-light"
    end

    def container
      BootstrapVersion::Use == 3 ? "container-fluid" : "container"
    end

    def navbar_header
      BootstrapVersion::Use == 3 ? "<div class='navbar-header page-scroll'>" : " "
    end

    def menu_button
      BootstrapVersion::Use == 3 ? "<button type='button' class='navbar-toggle' data-toggle='collapse' data-target='#bs-example-navbar-collapse-1'>" : "<button class='navbar-toggler navbar-toggler-right' type='button' data-toggle='collapse' data-target='#navbarResponsive' aria-controls='navbarResponsive' aria-expanded='false' aria-label='Toggle navigation'>"
    end



  end # class Navigation

end # module Blog::Cell
