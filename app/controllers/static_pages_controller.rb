class StaticPagesController < ApplicationController
  def home
    @link = Link.new
  end
end
