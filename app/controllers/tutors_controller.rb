class TutorsController < ApplicationController
  def new
    @tutor=Tutor.new
  end

  def index
    @tutors=Tutor.all
  end

  def create
    if user_signed_in?
      @tutor=Tutor.new(params_tutor)
      @tutor.user_name=current_user.name
      @tutor.user_id=current_user.id
      @tutor.user_email=current_user.email
      if @tutor.save
        redirect_to tutors_path
      else
        render 'new'
      end
    else
      flash[:notice]="You must sign in first"
      redirect_to new_user_session_path
    end
  end

  private
  def params_tutor
    params.require(:tutor).permit(:subject,:timing)
  end
end
