class Trainer::TrainersController < ApplicationController
  def show
    @trainer = current_trainer
    @today_lessons = Lesson.where("lessons.start_time == ?", Date.today).reorder(:start_time)
  end

  def edit
    @trainer = current_trainer
  end

  def update
    @trainer = current_trainer
    if @trainer.update(trainer_params)
      redirect_to  trainer_trainer_path(@trainer.id)
    else
      render 'edit'
    end
  end

  def history
    @trainer = current_trainer
    @lessons = @trainer.lessons
  end

  private
    def trainer_params
      params.require(:trainer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :profile_image, :pr_image, :pr_comment, :prefectures, :result, :email)
    end

end
