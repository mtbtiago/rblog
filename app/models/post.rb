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
#  image_file_name    :string
#  image_content_type :string
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
end
