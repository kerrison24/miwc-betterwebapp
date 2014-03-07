require "twitter"
    
    class TwitterWrapper 
        def initialize(key, secret, token, tokensecret)
          @client = Twitter::REST::Client.new do |config|
            config.consumer_key    = key
            config.consumer_secret = secret
            config.access_token        = token
            config.access_token_secret = tokensecret
          end
        end
            
        
        def search(term, another_term)
            @client.search(term, another_term)
        end
        
        def update(twt)
            @client.update(twt)
        end
    end