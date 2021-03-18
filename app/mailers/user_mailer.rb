class UserMailer < ApplicationMailer

    def create_user_mail(user)
        @user = user

        mail(to: @user.email, subject: "Bienvenido a la plataforma")
    end
    
end
