class StaticPagesController < ApplicationController
  
  def about
    @contact = StaticPage.new(params[:static_page])
  end

  def legal_mentions
  end

  def donation
  end

  def create
    @contact = StaticPage.new(params[:static_page])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        @contact = StaticPage.new
        format.html { render 'about'}
        format.js   { flash.now[:success] = "Merci pour ton message, nous te contacterons si nécessaire dans les plus bref délais !" }
      else
        format.html { render 'about' }
        format.js   { flash.now[:warning] = "Ton message n'a pas pu être envoyé." }
      end
    end
  end
end
