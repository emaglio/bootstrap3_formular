class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper Formular::RailsHelper

  def tyrant
    Tyrant::Session.new(request.env['warden'])
  end


  def render(cell_constant, model, options={})
    super(
          html: cell(
                cell_constant,
                model,
                { layout: Blog::Cell::Layout,
                  context: {current_user: tyrant.current_user, flash: flash}
                  }.merge(options))
          )
  end
private
  def _run_options(options)
    options.merge("current_user" => tyrant.current_user )
  end
end
