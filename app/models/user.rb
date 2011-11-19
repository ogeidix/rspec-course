class User < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_uniqueness_of :nickname  
  before_save             :capitalize_name_and_surname
  after_save              :retrieve_last_tweet, :if => Proc.new { |user| !user.nickname.blank? }
  
  def obfuscated_email
    return "invalid addredd " unless email[/@/]
    user, domain = email.split('@')
    user    = user[0..2]
    domain  = domain[/\w{3}\.\w{2,}$/]
    "#{user}...@...#{domain}" 
  end

  def to_param
    nickname
  end
  
  def retrieve_last_tweet
    Rails.logger.info "DOWNLOADING LAST TWEET OF #{nickname}"
  end
  
  protected
    def capitalize_name_and_surname
      name.capitalize!
      surname.capitalize!      
    end
end
