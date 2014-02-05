class LinksController < ApplicationController

  def show
    @link = Link.find_by short_url: params[:short_url]
  end

  def redirect
    @link = Link.find_by short_url: params[:short_url]
    redirect_to @link.long_url
  end

  def new
  end
end
