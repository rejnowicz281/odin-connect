class InvitationsController < ApplicationController
    before_action :set_invitation, only: [:show, :edit, :update, :destroy]

    def index
        @sent_invites = current_user.invites
        @received_invites = current_user.invites_received 
    end

    def show
    end

    def new
        @invitation = current_user.invitites.build
    end

    def create
        @invitation = current_user.invites.create(invitation_params)

        if @invitation.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @invitation.update(invitation_params)
            redirect_to root_path
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @invitation.destroy
        redirect_to root_path
    end

    private
    def set_invitation
        @invitation = FriendInvitation.find(params[:id])
    end

    def invitation_params
        params.require(:invitation).permit(:inviter_id, :invitee_id)
    end
end
