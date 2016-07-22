require 'uri'
require 'json'
require 'net/http'
require 'pry'
require 'omdbapi'
require 'yummly'

#Gif Searcher
def check_input(user_input)
    
#     used = 0
    
#     while used <= 8 do
    
        if user_input == ""
        
            input="random"
            url = "http://api.giphy.com/v1/gifs/search?q=#{input}&api_key=dc6zaTOxFJmzC"
            uri = URI(url)
            response = Net::HTTP.get(uri)
            data = JSON.parse(response)
            random_gif = data["data"].sample
            image = random_gif["images"]
            url = image["original"]["url"]
            # used = used + 1
        
        else
            def search_gif(user_input)
    
                url = "http://api.giphy.com/v1/gifs/search?q=#{user_input.gsub(" ", "+")}&api_key=dc6zaTOxFJmzC"
                uri = URI(url)
                response = Net::HTTP.get(uri)
                data = JSON.parse(response)
                random_gif = data["data"].sample
                image = random_gif["images"]
                url = image["original"]["url"]
                # used = used + 1

            end
    
                search_gif(user_input)

        end
    
    # end
    
end





def find_movie(user_input)
    
    if user_input == ""
        
        input = ["Sad","Bad","happy","love","why","murder","mystery","holy","pokemon","phantom","ghost", "comedy", "romance", "action", "drama", "mecha", "disney"]
        search = OMDB.search(input.sample)
        movie = search.sample
        @movie_title = movie[:title]
        @movie_id = movie[:imdb_id]
        @movie_type = movie[:type]
        @movie_img = movie[:poster]
        
    else
    
        search = OMDB.search(user_input)
        movie = search.sample
        @movie_title = movie[:title]
        @movie_id = movie[:imdb_id]
        @movie_type = movie[:type]
        @movie_img = movie[:poster]
        
    end
    #to link to the movie use www.imdb.com/title/#{id}/ and fill out neccessary perams
end

def find_song(user_input)
end





# def gif_repeat(check_input(user_input))
#     used_gifs = []
#     gifs = ''
#     gifs = check_input(user_input) 
#     used_gifs << gifs
#     if check_input(user_input) == used_gifs.sample
        
#         check_input(user_input)
        
#     else
        
#     end
    
    
# end

#yummly

#e54e9cfa05d58b64bab7da2301f05c0b&
require 'pry'




def food_search
    
    Yummly.configure do |config|
        config.app_id = "4e9f2aa0&"
        config.app_key = "e54e9cfa05d58b64bab7da2301f05c0b"
        config.use_ssl = true # Default is false
    end
    
    user_input = "happy"

    result = Yummly.search(user_input)
    find_food = result["matches"]
    random_food = find_food.sample
    puts random_food["recipeName"]
    
end

food_search

binding.pry








