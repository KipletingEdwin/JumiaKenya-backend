class PeopleController < ApplicationController
    def index
      people = Person.all
      render json: people, status: :ok
    end
  
    def show
      person = find_person
      render json: person
    end
  
    def update
      person = find_person
      person.update(person_params)
      render json: person, status: :ok
    end
  
    def destroy
      person = find_person
      person.destroy
      head :no_content
    end
  
    def create
      puts "Received parameters: #{params.inspect}"
  
      person = Person.new(person_params)
      if person.save
        render json: person, status: :created
      else
        render json: { error: person.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def person_params
      params.permit(:name, :image) 
    end
  
    def find_person
      Person.find(params[:id])
    end
  end
  