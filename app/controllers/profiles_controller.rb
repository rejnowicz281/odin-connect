class ProfilesController < ApplicationController
    def show
        @profile = Profile.find(params[:id])
    end

    def new
        @profile = current_user.build_profile
    end

    def create
        @profile = current_user.build_profile(profile_params)

        if @profile.save
            @profile.photo.attach(params[:profile][:photo])
            redirect_to @profile.user
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @profile = Profile.find(params[:id])
    end

    def update
        @profile = Profile.find(params[:id])

        if @profile.update(profile_params)
            @profile.photo.attach(params[:profile][:photo])
            redirect_to @profile.user
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @profile = Profile.find(params[:id])
        @user = @profile.user
        @profile.destroy
        redirect_to @user
    end

    private
    def profile_params
        params.require(:profile).permit(:phone_number, :gender, :birth_date, :location)
    end
end
