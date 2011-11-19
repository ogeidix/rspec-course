class User < ActiveRecord::Base
  validates_uniqueness_of :email
  before_save             :capitalize_name
  
  protected
    def capitalize_name
      name.capitalize!
    end
end
