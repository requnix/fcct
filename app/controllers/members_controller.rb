class MembersController < ApplicationController
  load_and_authorize_resource

  def index; end

  def edit; end

  def update
    if @member.update member_params
      redirect_to @member, notice: 'Your profile has been updated. Thanks!'
    else
      render action: :edit
    end
  end

private

  def member_params
    params.require(:member).permit(:email, :password, :password_confirmation, :current_password)
  end
end
