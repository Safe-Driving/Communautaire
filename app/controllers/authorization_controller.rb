class AuthorizationController < ApplicationController
  check_authorization
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|

    flash[:alert] = "Vous n'avez pas l'autorisation pour visualiser cette page."
    redirect_to root_url
  end
end
