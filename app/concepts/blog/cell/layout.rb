module Blog::Cell

  class Layout < Trailblazer::Cell
    include ActionView::Helpers::CsrfHelper

    def bootstrap
      BootstrapVersion::Use == 3 ? "bootstrap3" : "bootstrap4"
    end

    def header_class
      BootstrapVersion::Use == 3 ? "intro-header" : "masthead"
    end

    def layout_structure
      BootstrapVersion::Use == 3 ? "col-lg-8.col-lg-offset-2.col-md-10.col-md-offset-1" : "col-lg-8 offset-lg-2 col-md-10 offset-md-1"
    end

  end # class Layout

end # module Blog::Cell
