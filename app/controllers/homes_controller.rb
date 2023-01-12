class HomesController < ApplicationController
  def splash
    return unless current_user

    redirect_to categories_path
  end
end
