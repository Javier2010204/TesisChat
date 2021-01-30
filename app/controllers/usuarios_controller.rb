class UsuariosController < ApplicationController
    before_action :find_usuarios, except:[:new, :create, :index]
    before_action :set_careers
    
    def index
        @usuarios = User.all
    end

    def edit
        
    end

    def update
        respond_to do |format|
            if @usuario.update(usuario_params)
                @usuario.photo.attach(params[:user][:photo])
                format.html { render :show, notice: 'Foto agregada con exitos' }
            else
                format.html{render :new, alert: 'error al guardar la foto'}
            end
        end
    end
    
    

    def show
        
    end
    

    def new
        @usuario = User.new        
    end

    def create
        @usuario = User.new(usuario_params)

        respond_to do |format|
            if @usuario.save
                format.html { redirect_to @usuario, notice: 'usuario creado con exito' }
            else
                format.html{render :new, alert: 'error al crear el usuario intente de nuevo'}
            end
        end
    end
    
    


    private
        def find_usuarios
            @usuario = User.find(params[:id])
        end

        def set_careers
            @careers = Career.all
        end

        def usuario_params
            params.require(:user).permit(:name, :email, :password, :career_id, :rol, :photo, :points)
        end
        
        
        
    
end
