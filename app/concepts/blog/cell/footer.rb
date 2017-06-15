module Blog::Cell

  class Footer < Trailblazer::Cell

    def show
      BootstrapVersion::Use == 3 ? bootstrap3 : bootstrap4
    end

    def bootstrap3
      render view: :footer_bootstrap3
    end

    def bootstrap4
      render view: :footer_bootstrap4
    end

  end # class Footer

end # module Blog::Cell
