class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates_length_of :comment, :minimum => 6
  validate :check_movie_id_and_list_id

  def check_movie_id_and_list_id
    errors.add(:movie_id, "can't be the same as list id") if :movie_id == :list_id
  end
end
