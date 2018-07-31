class SearchesController < ApplicationController
  def search
  end

  def foursquare
    Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      #add this stuff to the requests that will result from the code above
      req.params['client_id']=client_id
      req.params['client_secret']=client_secret
      req.params['v']='20160201'
      req.params['near']=params[:zipcode]
      req.paramsp['query']='coffee shop'
  end
  render 'search'
end
