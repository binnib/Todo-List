class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    if user_signed_in?
      if current_user.role?('manager')
        redirect_to dashboard_path
      else
        # For developer to show todos list
        redirect_to todos_path
      end
      return false
    end
  end
end
