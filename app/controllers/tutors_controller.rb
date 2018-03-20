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

  def edit
      @tutor=Tutor.find(params[:id])
  end

  def update
    @tutor=Tutor.find(params[:id])
    @tutor.user_name=current_user.name
    @tutor.user_id=current_user.id
    @tutor.user_email=current_user.email
    if(@tutor.update(params_tutor))
      redirect_to @tutor
    else
      render 'edit'
    end
  end

  def show
    @tutor=Tutor.find(params[:id])
  end

  def destroy
    @tutor=Tutor.find(params[:id])
		@tutor.destroy

		redirect_to tutors_path
  end

  private
  def params_tutor
    params.require(:tutor).permit(:subject,:timing,:price)
  end

end
