class StaticPagesController < ApplicationController
  
  def about
    @contact = StaticPage.new(params[:static_page])
  end

  def legal_mentions
  end

  def donation
  end

  def contact_mail
    @contact = StaticPage.new(params[:static_page])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        @contact = StaticPage.new
        format.html { render 'index'}
        format.js   { flash.now[:success] = @message = "Merci pour ton message, nous te contacterons si nécessaire dans les plus bref délais !" }
      else
        format.html { render 'index' }
        format.js   { flash.now[:warning] = @message = "Ton message n'a pas pu être envoyé." }
      end
    end
  end
end
