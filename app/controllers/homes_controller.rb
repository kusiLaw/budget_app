class HomesController < ApplicationController

  def splash
    if current_user
      redirect_to categories_path
    end
  end
end