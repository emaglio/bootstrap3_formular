module User::Cell

  class Item < Trailblazer::Cell
    def link
      link_to model.email, model unless model == nil
    end
  end # class Item

end # module User::Cell
