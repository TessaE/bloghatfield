class StaticPagesController < ApplicationController
  def aboutme
  end

  def photos
  	@posts = Post.all
  end
end
