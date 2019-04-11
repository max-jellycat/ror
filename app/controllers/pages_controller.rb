class PagesController < ApplicationController
  def home; end
  def about
    @name = params[:name]
  end
end
