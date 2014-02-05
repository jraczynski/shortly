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

    link2 = Link.find_by long_url: @link.long_url

    if link2
      #TODO: remove link from memory?
      redirect_to showlink_path(link2.short_url)
    else
      if !@link.short_url
        @link.short_url = SecureRandom.urlsafe_base64(6)
        #if Link.find_by short_url: @link.short_url do
        #  @link.short_url = SecureRandom.urlsafe_base64(6)
        #end
      end

      if @link.save
        redirect_to showlink_path(@link.short_url)
      else
        #TODO: if error short_url not unique then generate new
        render 'static_pages/home' # or links/new if user logged in
      end
    end
  end

  private

    def link_params
      params.require(:link).permit(:short_url, :long_url)
    end
end
