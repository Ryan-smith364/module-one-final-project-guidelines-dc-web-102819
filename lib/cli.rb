require "pry"
require "tty-prompt"

PROMPT = TTY::Prompt.new
class Cli  

    

    #prompt Golfers to the item that best suits them
    def intro
        if PROMPT.yes?('Is this your first time making a review')  
           new_golfer
        else  
            name = PROMPT.ask("Enter your username!:")
            check_username(name)
        end
    end

   def new_golfer
    name = PROMPT.ask("Enter a username!:")
    avalable_name(name)
    
    main_menu
   end

    def avalable_name(name)
        user = Golfer.all.find do |golfer|
            golfer.name == name
        end

        if user == name
            handicap = PROMPT.ask("please enter your handicap (0-36):").to_i
            handicap_check(name, handicap)
        else
            "username unavailable please try again."
            new_golfer
        end
    end

   def check_username(name)
       check = Golfer.all.find do |golfer|
         
            golfer.name == name
        end
       # binding.pry
        if check == nil
            "no user found, please make an account or try again"
            intro
        else
            @current_user = check
            main_menu
        end
       # binding.pry
    end


    
   def handicap_check(name, handicap)
        if handicap >= 0 && handicap <= 36
            Golfer.create(name: name, handicap: handicap)
        else
            recheck = PROMPT.ask("please enter your handicap (0-36):").to_i
            handicap_check(name, recheck)
        end
    end

    def main_menu

        options = ["1) Find course by location.", "2) find course by your Handicap.", "3) Read reviews for courses.", "4) write a review for a course"]
       @select = PROMPT.select("Choose the item to best assist you: ", (options))
         main_menu_paths
    end

    def main_menu_paths
        if @select == "1) Find course by location."
           location_menu
        elsif @select ==  "2) find course by your Handicap."
            handicap_menu
        elsif @select == "3) Read reviews for courses."
            check_reviews
        elsif @select == "4) write a review for a course"
            post_review
        end
    end
    

  
    def location_menu

        locations =  Location.all.map do |location|
            location.city
        end
       
       selected_location = PROMPT.select("Which area would you like to visit?", (locations))
        #binding.pry
         # = find_course_by_location(selected_location)
        #puts out the selected course and all info
        #promps to return home
        find_course_by_location(selected_location)
    end

    def find_course_by_location(location)
        found_location = Location.all.find do |locate|
            #binding.pry
            locate.city == location
        end
        course = Course.all.find do |course|
           #binding.pry
            course.id == found_location.course_id
        end
       # course_info(course)
    end

    def course_object(name)
        Course.all.find do |course|
            course.name == name
        end
    end

    def review_objects(course_id)
        Review.all.select do |review|
            binding.pry
            reviews.course_id == course_id
        end
        
    end

    def course_info

        reviews = review_objects 
        stars = [ ]
        reviews.length.times{ 
             stars << review.rating
            }
           stars = stars.sum / stares.length
            
        puts course.name
        puts location
        reviews.length.times{
            # puts rating.rating
            # puts rating.review
            }
    end

    def select_difficulty(level)
        Course.all.select do |courses|
            courses.difficulty == level
        end

    end

    def handicap_prompts(diff)
        courses = select_difficulty(diff)
        course_names = courses.map do |course|
            course.name
        end
       
        @course = PROMPT.select("Which area would you like to visit?", (course_names))
       
    end

   def handicap_menu
        binding.pry
                
                if handicap >= 0 && self.handicap <= 5
                        handicap_prompts(6)
                elsif self.handicap >= 6 && self.handicap <= 12
                     handicap_prompts(5)
                elsif self.handicap >= 13 && self.handicap <= 18
                     handicap_prompts(4)
                elsif self.handicap >= 19 && self.handicap <= 24
                    handicap_prompts(3)
                elsif self.handicap >= 25 && self.handicap <= 30
                    handicap_prompts(2)
                else self.handicap >= 31 && self.handicap <= 36
                     handicap_prompts(1)
                end
        
            #puts out the selected course and all info
        #promps to return home
   end





   def check_reviews
    course = Course.all.map do |course|
        course.name
          
    end
    course_selected = PROMPT.select( "Which course would you like to check?", (course))

    course_object(course_selected)

    #outputs course name , rating, and reviews 
   
   end






   def post_review
        
    
        course = Course.all.map do |course|
            course.name
              
        end
        course_selected = PROMPT.select( "Which course would you like to review?", (course))

        course_object(course_selected)

        name = @current_user.name
        review_text = PROMPT.ask("What did you think of this course?")
        rating = PROMPT.ask("How many stars would you give this course(0-5):").to_i
        rating_check(rating)
        display_review(name,rating, review_text)
        review_check = PROMPT.yes?('Is this right?')
        
        

        if review_check == true
            Rating.new()
        else
            post_review
        end

    end

    def display_review(name, rating, review_text)
        puts name
        puts rating
        puts review_text
    end


    def rating_check(stars)
        if stars >= 0 && stars <= 5
            rating_in_range = stars
        else
            rating = PROMPT.ask("How many stars would you give this course(0-5):").to_i
            rating_check(rating)
        end
    end

end
