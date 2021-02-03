class EmailLinksController < ApplicationController
  def new
  end

  def create
    @email_link = EmailLink.generate(params[:email])

    if @email_link
      redirect_to new_user_session_path, notice: "revisa tu correo para obtener el link para ingresar"
    else
      redirect_to new_user_session_path, notice: "no existe el usuario para dicho correo"
    end
  end

  def validate
    email_link = EmailLink.where(token: params[:token]).where("expires_at > ?", DateTime.now).first

    unless email_link
      return redirect_to new_user_session_path, notice: "El link es invalido o ya expiro"
    end

    sign_in(email_link.user, scope: :user)
    redirect_to root_path
  end
  
end
