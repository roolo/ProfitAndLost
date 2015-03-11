require 'active_resource'

module Remote
  module Billapp
    class Base < ActiveResource::Base
      self.format = :json


      # @param [User] user
      def self.set_ba_credentials user
        Remote::Billapp::Base.site = 'https://%s.billapp.cz/'%[
          user.billapp_subdomain
        ]
        Remote::Billapp::Base.user = user.billapp_username
        Remote::Billapp::Base.password = user.billapp_userpass
      end

    end
  end
end
