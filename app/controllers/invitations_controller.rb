class InvitationsController < ApplicationController
    before_action :set_invitation, only: [:destroy]

    def create
        @invitation = current_user.invites.create(invitation_params)

        redirect_to root_path
    end

    def destroy
        @invitation.destroy

        redirect_to root_path
    end

    private
    def set_invitation
        @invitation = Invitation.find(params[:id])
    end

    def invitation_params
        params.require(:invitation).permit(:inviter_id, :invitee_id)
    end
end
