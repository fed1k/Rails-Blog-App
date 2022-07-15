class ApplicationController < ActionController::Base
  def current_user
    @first_user = User.find(8)
    @first_user
  end
end
