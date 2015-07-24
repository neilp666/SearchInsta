class PagesController < ApplicationController
  def home
    access_token = ENV["CONFIG.ACCESS_TOKEN"]
    #Access token identifies the user, 
 
    client = Instagram.client(access_token: access_token)
    
  
    default_search = client.tag_search('travel')
   

    if params[:q] 
      search_query = client.tag_search(params[:q])
      @tag = search_query.present? ? search_query : default_search

    else 
      @tag = default_search 
    end

    @tag = @tag.first.name
    @search = client.tag_recent_media(@tag)

   

  end

  def about
  end
  
end

#searching for a default tag and if user proviedes another tag
#it searches for that tag. Then it will look for the first item of the result 
#and i ask for the tag recent media for that name.

