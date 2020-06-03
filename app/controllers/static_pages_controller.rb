class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @mircopost = current_user.microposts.build
      @feed_item = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about
    
  end
  
  def contact
  end
  
  def search
    if params[:search].blank?  
    redirect_to(root_path, alert: "Empty field!") and return  
    else
      @parameter = params[:search].downcase  
      @results = User.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end
      
  end
end
