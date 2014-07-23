require 'active_support/concern'
require 'active_support/core_ext/numeric'


module Medal
  extend ActiveSupport::Concern

  included do
  	validates  :type_of_medal,   presence: true
  	validates_uniqueness_of :type_of_medal, scope: :dragon_id
  end





  module ClassMethods
  end

end