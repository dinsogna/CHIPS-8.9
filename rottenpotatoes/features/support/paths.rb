# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    puts "PATH TO () CALL"
    case page_name
    # puts "CASE: #{page_name}"

    when /^the (RottenPotatoes )?home\s?page$/ then '/movies'
    # puts 'ONE'
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
      # when /^(.*)'s profile page$/i
        # user_profile_path(User.find_by_login($1))

    # when /^the the edit page for (.*)/ then '/movies'
    # puts 'TWO'
    when /the edit page for "(.*)"$/
      puts "Edit page"
      puts $1
      edit_movie_path(Movie.find_by_title($1).id)
      # m = Movie.where(title: $1).id
      # puts m

      # go to the edit page, movie_path(m)
      # edit_movie_path(m)

    when /the details page for "(.*)"$/
      puts "Details page"
      puts $1
      movie_path(Movie.find_by_title($1).id)
      # movie_path(Movie.find_similar_movies($1))

    when /the Similar Movies page for "(.*)"$/
      puts "SIM MOVIE PAGE"
      puts $1
      find_similar_path(Movie.find_by_title($1))

    else
      puts "ELSE"
      begin
        puts "BEGIN"
        page_name =~ /^the (.*) page$/
        puts "PAGE NAME: #{page_name}"
        path_components = $1.split(/\s+/)
        puts "PATH COMPONENTS: #{path_components}"
        # puts "BEGIN"
        # puts page_name
        # puts path_components
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        puts 'RESCUE'
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
