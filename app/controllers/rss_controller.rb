# Copyright (C) 2012-2014 Zammad Foundation, http://zammad-foundation.org/

class RssController < ApplicationController
  before_filter :authentication_check

=begin

Resource:
GET /api/v1/rss_fetch

Response:
{
  ...
}

Test:
curl http://localhost/api/v1/rss_fetch.json -v -u #{login}:#{password} -H "Content-Type: application/json" -X GET

=end

  def fetch
    items = Rss.fetch(params[:url], params[:limit])
    if items == nil
      render json: { message: "failed to fetch #{ params[:url] }", status: :unprocessable_entity }
      return
    end
    render json: { items: items }
  end

end
