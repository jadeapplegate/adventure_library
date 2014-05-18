class Adventure < ActiveRecord::Base
  has_many :pages
  belongs_to :library
  accepts_nested_attributes_for :pages

  # before_save

  # validates :title, length: { minimum: 4 }
  # validates :author, length: { minimum: 3 }
  validates :guid, presence: true, length: { minimum: 6}
end
