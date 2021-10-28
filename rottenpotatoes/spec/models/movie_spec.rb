# # require 'rails_helper'
# # # require 'app/models'3

# # describe Movie do
# #     describe '.find_similar_movies' do
# #         let!(:movie1) { FactoryGirl.create(:movie, title: 'Catch me if you can', director: 'Steven Spielberg') }
# #         let!(:movie2) { FactoryGirl.create(:movie, title: 'Seven', director: 'David Fincher') }
# #         let!(:movie3) { FactoryGirl.create(:movie, title: "Schindler's List", director: 'Steven Spielberg') }
# #         let!(:movie4) { FactoryGirl.create(:movie, title: "Stop") }
# #         context 'director exists' do
# #             it 'finds similar movies correctly' do
# #                 expect(Movie.similar_movies(movie1.title)).to eql(['Catch me if you can', "Schindler's List"])
# #                 expect(Movie.similar_movies(movie1.title)).to_not include(['Seven'])
# #                 expect(Movie.similar_movies(movie2.title)).to eql(['Seven'])
# #             end
# #         end

# #         # it 'should return the correct matches for movies by the same director' do
# #         #     movie1 = FactoryGirl.create(:movie, title: 'Catch me if you can', director: 'Steven Spielberg')
# #         #     movie2 = FactoryGirl.create(:movie, title: 'Seven', director: 'David Fincher')
# #         #     # let!(:movie3) { FactoryGirl.create(:movie, title: "Schindler's List", director: 'Steven Spielberg') }
# #         #     # let!(:movie4) { FactoryGirl.create(:movie, title: "Stop") }
# #         #     puts Movie.all
# #         #     expect(1).to eq(1)
# #         # end
# #     end
# # end
# # # it should not return matches of movies by different directors.
# require 'rails_helper'

# RSpec.describe Movie, type: :model do
#   before(:all) do
#     if Movie.where(:director => "Jon Favreau").empty?
#       Movie.create(:title => "Iron Man", :director => "Jon Favreau",
#                    :rating => "PG-13", :release_date => "2008-05-02")
#       Movie.create(:title => "Spider-Man: Homecoming", :director => "Jon Favreau",
#                    :rating => "PG-13", :release_date => "2017-07-07")
#     end

#     if Movie.where(:title => "Big Hero 6").empty?
#       Movie.create(:title => "Big Hero 6",
#                    :rating => "PG", :release_date => "2014-11-07")
#     end
#   end

#   describe "others_by_same_director method" do
#     it "returns all other movies by the same director" do
#       movie = Movie.find_by_title("Iron Man")
#       other_movies = movie.others_by_same_director()
#       expect(other_movies.length()).to eq 1
#       expect(other_movies).to include(Movie.find_by_title("Spider-Man: Homecoming"))
#     end

#     it "does not return movies by other directors" do
#       movie = Movie.find_by_title("Big Hero 6")
#       other_movies = movie.others_by_same_director()
#       expect(other_movies).to be_empty
#     end
#   end
# end
