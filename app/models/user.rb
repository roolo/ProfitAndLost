class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def has_billapp_credentials?
    billapp_subdomain.present? &&
    billapp_username.present? &&
    billapp_userpass.present?
  end
end
