require 'securerandom'

class LinksController < ApplicationController
  before_action :correct_user,   only: [:edit, :update, :destroy]

  def show
    @link = Link.find_by short_url: params[:short_url]
  end

  def redirect
    @link = Link.find_by short_url: params[:short_url]
    @link.increment!(:visits)
    redirect_to @link.long_url
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    #TODO: make an outer method

    if signed_in?
      link2 = current_user.links.find_by long_url: @link.long_url
    else
      link2 = Link.find_by long_url: @link.long_url
    end

    if link2
      #TODO: remove link from memory?
      redirect_to showlink_path(link2.short_url)
    else
      if !@link.short_url || @link.short_url == ""
        @link.short_url = SecureRandom.urlsafe_base64(6)
        #if Link.find_by short_url: @link.short_url do
        #  @link.short_url = SecureRandom.urlsafe_base64(6)
        #end
      end

      if signed_in?
        @link.user_id = current_user.id
      end

      if @link.save
        redirect_to showlink_path(@link.short_url)
      else
        #TODO: if error short_url not unique then generate new
        render 'static_pages/home' # or links/new if user logged in
      end
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      flash[:success] = "Link updated"
      redirect_to @link.user
    else
      render 'edit'
    end
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy
    flash[:success] = "Link deleted."
    redirect_to link.user
  end

  private

    def link_params
      params.require(:link).permit(:short_url, :long_url)
    end

    def correct_user
      @user = Link.find(params[:id]).user
      redirect_to(@user) unless current_user?(@user)
    end
end
