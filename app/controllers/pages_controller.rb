class PagesController < ApplicationController
  def home
  end

  def help
    render text: "Coming soon..."
  end
end
