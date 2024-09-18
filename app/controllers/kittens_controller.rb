class KittensController < ApplicationController

def index
    @kittens = Kitten.all

    respond_to do |format|
        format.json { render :index => Kitten.all }
end

def show
    @kitten = Kitten.find(params[:id])
end

def new
    @kitten = Kitten.new
end

def create
    @kitten = Kitten.new(require_params)
    if @kitten.save
        flash[:notice] = "Succesully created"
            redirect_to kittens_path
    else
        render :new, status: :unprocessable_entity
    end
end

def edit
    @kitten = Kitten.find(params[:id])
end

def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(require_params)
        flash[:notice] = "Success"
        redirect_to kittens_path
    else
        render :new, status: :unprocessable_entity
    end
end

def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
        redirect_to kittens_path, notice: "Movie successfully dest"
end

private 
    def require_params
        params.require(:kitten).
            permit(:name, :age, :cuteness, :softness)
    end
end
