class ProfilesController < ApplicationController
    def new
        @profile = current_user.build_profile
    end

    def create
        @profile = current_user.build_profile(profile_params)

        if @profile.save
            @profile.photo.attach(params[:profile][:photo])
            redirect_to current_user
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def profile_params
        params.require(:profile).permit(:phone_number, :gender, :birth_date, :location)
    end
end
