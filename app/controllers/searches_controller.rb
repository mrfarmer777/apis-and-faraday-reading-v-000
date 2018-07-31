class SearchesController < ApplicationController
  def search
  end

  def foursquare
    Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      #add this stuff to the requests that will result from the code above
      req.params['client_id']='EQTX1NQG0J0L00R3IO3HYS2D4JCMUBZ0JRS05GBQ1DJJAKJG'
      req.params['client_secret']='QOC02PHQNYVRBZEBPSEFET51BDX3X1RXF0FSLOLEOWS444VN'
      req.params['v']='20160201'
      req.params['near']=params[:zipcode]
      req.params['query']='coffee shop'
    end
    render 'search'
  end

end
