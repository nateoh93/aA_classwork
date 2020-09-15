# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string           not null
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#
class Post < ApplicationRecord
    validates :title, :author_id, :sub_id, presence: true

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    has_many :post_subs,
        foreign_key: :post_id,
        class_name: :PostSub

    has_many :sub_forums, 
        through: :post_subs,
        source: :sub
    
end
