class PagesController < ApplicationController
    def home
        redirect_to articles_path if logged_in? #kliknięcie HOME zalogowanego użytkownika wsadzi do widoku artykułów a nie strony głównej
    end
    def about
        
    end
end
