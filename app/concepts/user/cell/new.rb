module User::Cell

  class New < Trailblazer::Cell
    include ActionView::RecordIdentifier
    include ActionView::Helpers::FormOptionsHelper
    include Formular::Helper
    include Formular::RailsHelper
  end # class New

end # module User::Cell
