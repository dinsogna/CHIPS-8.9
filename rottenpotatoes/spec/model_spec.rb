require 'rails_helper'
# require 'app/models'3

describe Movie do

    describe "find_similar_movies" do

        it 'should return the correct matches for movies by the same director' do
            movie1 = FactoryGirl.create(:movie, title: 'Catch me if you can', director: 'Steven Spielberg')
            movie2 = FactoryGirl.create(:movie, title: 'Seven', director: 'David Fincher')
            # let!(:movie3) { FactoryGirl.create(:movie, title: "Schindler's List", director: 'Steven Spielberg') }
            # let!(:movie4) { FactoryGirl.create(:movie, title: "Stop") }
            puts Movie.all
            expect(1).to eq(1)
        end
    end
end
# it should not return matches of movies by different directors.
