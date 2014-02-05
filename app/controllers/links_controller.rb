require 'securerandom'

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

  def create
    @link = Link.new(link_params)
    #TODO: make an outer method
    if !@link.short_url
      @link.short_url = SecureRandom.urlsafe_base64(6)
    end
    if @link.save
      redirect_to root_url+"s/"+@link.short_url
    else
      render 'static_pages/home'
    end
  end

  private

    def link_params
      params.require(:link).permit(:short_url, :long_url)
    end
end
