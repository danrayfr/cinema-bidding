module Mutations
  class CreateMovie < BaseMutation
    argument :title, String, required: true
    
    type Types::MovieType

    def resolve(title:)
      Movie.create!(
        title: title,
        user_id: current_user.id
      )
    end

  end
end