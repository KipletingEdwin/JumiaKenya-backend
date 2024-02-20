class ApplicationController < ActionController::Base
    before_action :authorized

    def encode_token(payload)
        #should store secret in env variable
        JWT.encode(payload, 'my_')
    end
end
