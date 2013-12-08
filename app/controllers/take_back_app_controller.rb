class TakeBackAppController < ApplicationController
  def home
    if signed_in?
      @project  = current_user.projects.build
    end
  end

end
