module Comment::Cell

  class Show < Trailblazer::Cell
    property :body

    def reaction
      weights = {
        0 => "Neutral",
        1 => "Agreed",
        2 => "Not Agreed"
      }

      return weights[model.weight]
    end
  end # class Show

end # module Comment::Cell
