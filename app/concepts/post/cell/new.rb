module Post::Cell

  class New < Trailblazer::Cell
    include ActionView::RecordIdentifier
    include ActionView::Helpers::FormOptionsHelper
    include Formular::Helper
    include Formular::RailsHelper

    def current_user
      return options[:context][:current_user]
    end

    def bootstrap
      BootstrapVersion::Use == 3 ? :bootstrap3 : :bootstrap4
    end
  end # class New

end # module Post::Cell
