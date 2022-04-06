class ApplicationController < ActionController::Base

  def render_404
    render file: "public/404.html", status: 404
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

end
