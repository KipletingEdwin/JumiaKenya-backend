class PeopleController < ApplicationController

    def create
        person = Person.create(person_params)
        render json: person status: :created
    end

    private

    def person_params
        params.permit(:person, "image_url")
    end
end
