require 'uri'
require 'json'
require 'net/http'
require 'pry'
require 'omdbapi'
require 'yummly'

#Gif Searcher

def check_input(user_input)
    
        if user_input == ""
        
            input=["Sad","Bad","happy","love","why", "anime","murder","mystery","holy","pokemon","phantom","ghost", "comedy", "romance", "action", "drama", "mecha", "disney", "cute", "funny", "vine", "loop"]
            url = "http://api.giphy.com/v1/gifs/search?q=#{input.sample}&api_key=dc6zaTOxFJmzC"
            uri = URI(url)
            response = Net::HTTP.get(uri)
            data = JSON.parse(response)
            random_gif = data["data"].sample
            image = random_gif["images"]
            url = image["original"]["url"]

        else
            def search_gif(user_input)
    
                url = "http://api.giphy.com/v1/gifs/search?q=#{user_input.gsub(" ", "+")}&api_key=dc6zaTOxFJmzC"
                uri = URI(url)
                response = Net::HTTP.get(uri)
                data = JSON.parse(response)
                random_gif = data["data"].sample
                image = random_gif["images"]
                url = image["original"]["url"]

            end
    
                search_gif(user_input)

        end
    
end


#Movie Search

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
    
        search = OMDB.search(user_input.gsub(" ", "+"))
        movie = search.sample
        @movie_title = movie[:title]
        @movie_id = movie[:imdb_id]
        @movie_type = movie[:type]
        @movie_img = movie[:poster]
        
    end
    
end


#Video search

def find_video(user_input)
    
    if user_input == ""
        
        input = ["top", "Marcus Butler", "Tyler Oakley", "Zoella", "PointlessBlog", "FunforLuis", "SprinkleOfGlitter", "ThatcherJoe", "Games", "Music", "Pewdiepie", "Caspar Lee", "Connor Franta", "Troye Sivan", "NigaHiga", "Upperline", "Parachuting", "Extreme Sports", "Happy", "Hello", "Avril Lavigne", "Adele", "Taylor Swift", "Katy Perry", "Domics", "iiSuperwomanii", "Miranda Sings", "Jenna Marbles", "Anime", "Disney", "Cartoon Network", "Federator Studios", "Bee and Puppycat", "Shirokuma Cafe", "Will Darbyshire", "Shane Dawson"]
        
        url = "https://www.googleapis.com/youtube/v3/search?part=snippet%20&q=#{input.sample.gsub(" ", "+")}%20&type=video%20&key=AIzaSyDGO_FsdRi0Q7Mqctdx2PEJe-n7lm_zIbo"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
    
        enter_vid_hash = data["items"]
        choose_vid = enter_vid_hash.sample
        @vid_id = choose_vid["id"]["videoId"] 
        @vid_pic = choose_vid["snippet"]["thumbnails"]["default"]["url"]
    
    else
        
        url = "https://www.googleapis.com/youtube/v3/search?part=snippet%20&q=#{user_input.gsub(" ", "+")}%20&type=video%20&key=AIzaSyDGO_FsdRi0Q7Mqctdx2PEJe-n7lm_zIbo"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
    
        enter_vid_hash = data["items"]
        choose_vid = enter_vid_hash.sample
        @vid_id = choose_vid["id"]["videoId"]
        @vid_pic = choose_vid["snippet"]["thumbnails"]["default"]["url"]
        
    end
    
end

#Food search

def food_search(user_input)
    
    if user_input == ""
        
        input = ["Disney", "Pokemon", "Happy", "Sad", "Angry", "Cool", "Easy", "No-Bake", "Macaroons", "Brownies", "Cookies", "Cake", "Cupcake", "Chicken", "Dessert", "Lunch", "Breakfast", "Dinner", "Brunch", "Sandwich", "Fries", "Ice-Cream"]
        
        url = "https://api.yummly.com/v1/api/recipes?_app_id=4e9f2aa0%26&_app_key=e54e9cfa05d58b64bab7da2301f05c0b&q=#{input.sample}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
    
        get_food = data["matches"].sample
        @food_name = get_food["recipeName"]
        @food_img = get_food["imageUrlsBySize"]["90"]
        @food_attr = get_food["attributes"]["course"].each do |i|
            puts i
        end
        food_id = get_food["id"]
        @food_link = "http://www.yummly.com/recipe/#{food_id}"
        puts @food_link
        puts @food_name
        puts @food_img
        
    else
        
        url = "https://api.yummly.com/v1/api/recipes?_app_id=4e9f2aa0%26&_app_key=e54e9cfa05d58b64bab7da2301f05c0b&q=#{user_input.gsub(" ", "+")}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
    
        get_food = data["matches"].sample
        @food_name = get_food["recipeName"]
        @food_img = get_food["imageUrlsBySize"]["90"]
        @food_attr = get_food["attributes"]["course"].each do |i|
            puts i
        end
        food_id = get_food["id"]
        @food_link = "http://www.yummly.com/recipe/#{food_id}"
        puts @food_link
        puts @food_name
        puts @food_img
        
    end
    
end

#ID for youtube
#monorater-1380
#AIzaSyBYuC8yk2jXxalAC3Yg_52ZZuIhlQW5v0o








