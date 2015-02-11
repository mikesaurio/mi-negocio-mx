class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :municipio_id, presence: true
  belongs_to :municipio


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      puts '}}}}}}}}}}}}}}}}}}}}}}}'
      user.provider = auth.provider
      puts user.provider
      user.uid = auth.uid
        puts user.uid
      user.name = auth.info.name
      puts user.name
      user.email = auth.info.email
      puts user.email
      user.password = 'codeandomexico'
      puts user.password
      user.oauth_token = auth.credentials.token
      puts user.oauth_token
      #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      #puts user.oauth_expires_at.to_s
      user.municipio_id = '1'  
      puts    user.errors
      user.save!
      puts user.errors
           puts '}}}}}}}}}}}}}}}}}}}}}}}'
    end
  end

end
