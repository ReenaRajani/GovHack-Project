class PagesController < ApplicationController
  def landing
  end
  def details
    info = {
      :success => true
    }
    render :text => info.to_json
  end
end
