class SearchsController < ApplicationController
    def search
      @model = params["model"]
      @content = params["content"]
      @method = params["method"]
      @records = search_for(@model, @content, @method)
    end
  
    private
    def search_for(model, content, method)
      if model == 'user'
        if method == 'perfect'
          User.where(name: content)
        else
          User.where('name LIKE ?', '%'+content+'%')
        end
      elsif                       #model == 'tweet'
        redirect_to root_url
        # if method == 'perfect'
        #   Tweet.where(content: content)
        # else
        #   Tweet.where('content LIKE ?', '%'+content+'%')
        # end
      end
    end
  end
  