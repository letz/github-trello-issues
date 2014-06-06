require 'sinatra'
require 'sinatra/base'
require 'json'
require 'ap'
require 'trello'

module GithubTrello
  class Server < Sinatra::Base

    configure do
      Trello.configure do |config|
        config.developer_public_key = ENV['PUBLIC_KEY']
        config.member_token = ENV['TOKEN']
      end
    end

    post '/posthook' do
      response = JSON.parse request.body.read

      if response['action'] == 'opened' || response['action'] == 'reopened'
            card = Trello::Card.create({
              name: "##{response['issue']['number']} - #{response['issue']['title']}",
              list_id: ENV['LIST_ID'],
              desc: "#{response['issue']['body']} \n\n #{response['issue']['html_url']}" })
      end
    end

  end
end