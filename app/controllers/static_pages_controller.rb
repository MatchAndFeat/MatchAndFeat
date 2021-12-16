class StaticPagesController < ApplicationController
  
  def about
  end

  def legal_mentions
  end

  def donation
  end

  def index
    @contact = StaticPage.new(params[:static_page])
  end

  def create
    @contact = StaticPage.new(params[:static_page])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = StaticPage.new
        format.html { render 'index'}
        format.js   { flash.now[:success] = @message = "Merci pour votre message, nous vous contactons dans les plus bref délais !" }
      else
        format.html { render 'index' }
        format.js   { flash.now[:error] = @message = "Votre message n'a pas été envoyé." }
      end
    end
  end
end
