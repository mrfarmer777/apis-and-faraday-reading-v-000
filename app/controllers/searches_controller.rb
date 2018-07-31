class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp=Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      #add this stuff to the requests that will result from the code above
      req.params['client_id']='EQTX1NQG0J0L00R3IO3HYS2D4JCMUBZ0JRS05GBQ1DJJAKJG'
      req.params['client_secret']='QOC02PHQNYVRBZEBPSEFET51BDX3X1RXF0FSLOLEOWS444VN'
      req.params['v']='20160201'
      req.params['near']=params[:zipcode]
      req.params['query']='coffee shop'
      req.options.timeout=0
    end

    body=JSON.parse(@resp.body)

    if @resp.success?
      @venues=body["response"]["venues"]
      render 'search'
    else
      @error=body["meta"]["errorDetail"]
    end

    rescue Faraday::ConnectionFailed
      @error="There was a timeout. PLease try again."
    end
    render "search"
  end

end
