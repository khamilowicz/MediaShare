class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def to_s
    nick
  end

  def self.from_facebook data
    info = data['info']
    user = User.where(email: info['email']).first_or_initialize do |u|
      u.nick = info['name']
    end
    user.save
    user
  end
end
