class Movie < ActiveRecord::Base
  def self.find_similar_movies(director_name)
    self.where(director: director_name).all
  end
# def similar_movies(movie)
#     puts "SIMILAR MOVIES"
#     puts movie
# end
end
