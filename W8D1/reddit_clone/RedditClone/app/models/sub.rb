# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  description  :string           not null
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  moderator_id :integer          not null
#
# Indexes
#
#  index_subs_on_moderator_id  (moderator_id)
#
class Sub < ApplicationRecord
    validates :description, :title, :moderator_id, presence: true

    belongs_to :moderator,
        foreign_key: :moderator_id,
        class_name: :User

    has_many :post_subs,
        foreign_key: :sub_id,
        class_name: :PostSub

    has_many :posts,
        through: :post_subs,
        source: :post
end
