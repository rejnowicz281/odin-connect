class InvitationsController < ApplicationController
    before_action :set_invitation, only: [:destroy]

    def new
        @not_friends = User.where.not(id: current_user.id) - current_user.friends - current_user.invitees
        @invitation = current_user.invites.build
    end

    def create
        @invitation = current_user.invites.create(invitation_params)

        redirect_to new_invitation_path
    end

    def destroy
        @invitation.destroy

        redirect_back fallback_location: root_path
    end

    private
    def set_invitation
        @invitation = Invitation.find(params[:id])
    end

    def invitation_params
        params.require(:invitation).permit(:inviter_id, :invitee_id)
    end
end
