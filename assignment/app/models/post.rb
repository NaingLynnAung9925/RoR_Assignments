class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 200}
  validates :description, presence: true, length: {minimum: 10}

  belongs_to :user
  

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |post|
        csv << post.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true ) do |row|
    post = find_by_id(row["id"]) || new
    post.attributes = row.to_hash
    post.save!
    end
  end

end
