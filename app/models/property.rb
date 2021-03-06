class Property < ApplicationRecord
  include PgSearch
  has_many :posts, dependent: :destroy
  has_many :issues, dependent: :destroy
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :address
  has_many :posted_users, through: :posts,  source: :user
  has_many :complaining_users, through: :issues,  source: :user
  has_attached_file :avatar,
    :storage => :s3,
    :styles => {
    thumb: '100x100#',
    square: '200x200>',
    medium: '540x283'
  },
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :bucket => 'hudson-lab-images',
    :url => ":s3_domain_url",
    :path => "/:class/avatars/:id_:basename.:style.:extension"


  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  paginates_per 12
   max_paginates_per 24

 accepts_nested_attributes_for :posts
 def average_ratings
   return 0 if posts.empty?
   posts.map{|p| p.rating}.inject(:+) / posts.size
 end

 def issue_count
  list = issues.map{|issue| issue.severity}
  counts = Hash.new(0)
    list.each {|issue| counts[issue] += 1}
  counts
 end

   pg_search_scope :search_property, against: [:Fulladdress]

  def self.search(term)
    @properties = Property.where('Fulladdress LIKE ? or name LIKE ? or description LIKE ? or rental_rate LIKE ? or category LIKE ?', "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%") if term.present?
  end
end

