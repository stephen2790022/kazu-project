class UserMailer < ApplicationMailer
    default from: 'no-reply-to-kasu@yopmail.com'
   
    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'https://kasu-project.herokuapp.com' 
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end

    def match_email(user, library_item)
        #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
        #@user = user
        @email = user.email
        
        @item = library_item
        @username = user.name

        # # #on définit une variable @url qu'on utilisera dans la view d’e-mail
        @url  = 'https://kasu-project.herokuapp.com' 
      
        # # # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
        mail(to: @email, subject: 'Tu as un match !') 
    end

    def transaction_email(user, library_item)
        @email = user.email
          
        @item = library_item
        @username = user.name

        # # #on définit une variable @url qu'on utilisera dans la view d’e-mail
        @url  = 'https://kasu-project.herokuapp.com' 
      
        # # # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
        mail(to: @email, subject: 'Un échange sur https://kasu-project.herokuapp.com !') 
    end

    
end
