class PeopleController < ApplicationController
    def index
      people = Person.all
      render json: people, status: :ok
    end
  
    def show
      person = find_person  # Corrected from fine_person
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
      person = Person.create(person_params)
      render json: person, status: :created
    end
  
    private
  
    def person_params
      params.permit(:name, :image_url)
    end
  
    def find_person  
      Person.find(params[:id])
    end
  end
  