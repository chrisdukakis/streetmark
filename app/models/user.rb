class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
  field :username, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password, type: String
  field :lat, type: Float
  field :lng, type: Float

  has_many :posts
  has_many :comments
  
  has_mongoid_attached_file :avatar
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def self.serialize_from_session(key, salt)
    record = to_adapter.get(key[0]["$oid"])
    record if record && record.authenticatable_salt == salt
  end
  
  self.singleton_class.send(:alias_method, :serialize_from_cookie, :serialize_from_session)
end
