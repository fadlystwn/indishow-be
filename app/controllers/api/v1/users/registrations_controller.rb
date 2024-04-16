# app/controllers/api/v1/users/registrations_controller.rb
module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        def create
          build_resource(sign_up_params)

          if resource.save
            render json: resource
          else
            render json: { errors: resource.errors }, status: :unprocessable_entity
          end
        end

        private

        def sign_up_params
          params.require(:user).permit(:email, :password, :password_confirmation)
        end
      end
    end
  end
end
