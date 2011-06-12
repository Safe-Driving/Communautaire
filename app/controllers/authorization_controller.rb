class AuthorizationController < ApplicationController
  check_authorization
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :root, :alert => exception.message
  end
end
