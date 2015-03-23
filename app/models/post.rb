# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  category_id        :integer
#  user_id            :integer
#  tags               :text
#  body               :text
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :comments
	
	validates :title, presence: true
	validates :category_id, presence: true
	validates :body, presence: true

	has_attached_file :image, :default_url => ":style/rails1.jpg"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	def self.search(query)
		where("title like ? OR body like ?", "%#{query}%", "%#{query}%")
	end
end
