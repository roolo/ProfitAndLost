require 'active_resource'

module Remote
  module Billapp
    class Base < ActiveResource::Base
      # @todo Dynamic agenda
      self.site = 'https://rooland.billapp.cz/'

      # @todo Dynamic credentials
      self.user = 'registrace@rooland.cz'
      self.password = 'CHov8j/9YF3aY/FUf.yBC'

      self.format = :json
    end
  end
end
