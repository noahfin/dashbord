class Deal < ApplicationRecord
  has_many :posts
  has_many :issues
   has_and_belongs_to_many :contacts
  has_many :complaining_users, through: :issues,  source: :user
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

end
