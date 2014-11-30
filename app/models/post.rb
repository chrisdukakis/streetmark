class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :title,       type: String
  field :photo,       type: String
  field :description, type: String
  field :rating,      type: Integer, default: 0
  field :voters,      type: Array, default: []
  field :loc,         type: Array
  field :address,     type: String
  field :solved,      type: Boolean, default: false
  has_many :comments, :order => :created_at.desc
  belongs_to :user
  has_mongoid_attached_file :photo
  do_not_validate_attachment_file_type :photo
  index({ rating: 1, title: 1, user_id: 1 })

  def before_image_post_process
  end

end

def post_params
  params.require(:post).permit(:photo)
end