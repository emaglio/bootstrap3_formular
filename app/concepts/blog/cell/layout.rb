module Blog::Cell

  class Layout < Trailblazer::Cell
    include ActionView::Helpers::CsrfHelper

    def bootstrap
      BootstrapVersion::Use == 3 ? "bootstrap3" : "bootstrap4"
    end

  end # class Layout

end # module Blog::Cell
