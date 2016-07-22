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
        
            input=["Sad","Bad","happy","love","why","murder","mystery","holy","pokemon","phantom","ghost", "comedy", "romance", "action", "drama", "mecha", "disney", "cute", "funny", "vine", "loop"]
            url = "http://api.giphy.com/v1/gifs/search?q=#{input.sample}&api_key=dc6zaTOxFJmzC"
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
# require 'pry'




def food_search
    
    user_input = "sad"
    
    url = "https://api.yummly.com/v1/api/recipes?_app_id=4e9f2aa0%26&_app_key=e54e9cfa05d58b64bab7da2301f05c0b&q=#{user_input}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    
    get_food = data["matches"].sample
    food_name = get_food["recipeName"]
    food_img = get_food["imageUrlsBySize"]["90"]
    food_attr = get_food["attributes"]["course"].each do |i|
        puts i
    end
    food_id = get_food["id"]
    food_link = "http://www.yummly.com/recipe/#{food_id}"
    #http://www.yummly.com/recipe/#{id} to link to food
    puts food_link
    puts food_name
    puts food_img
    
    # Yummly.configure do |config|
    #     config.app_id = "4e9f2aa0&"
    #     config.app_key = "e54e9cfa05d58b64bab7da2301f05c0b"
    #     config.use_ssl = true # Default is false
    # end
    
    

    # result = Yummly.search(user_input)
    
    # #The food's name 
    # get_names = result.collect { |recipe| recipe.name }
    # name = get_names.sample
    # puts name
    
    #An image of the food collected
    
end

food_search

# binding.pry








