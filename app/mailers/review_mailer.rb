class ReviewMailer < ApplicationMailer

  def review_email
    @review = params[:review]
    @restaurant = params[:restaurant]
    @user = params[:user]
    mail(to: "#{@restaurant.user.name} <#{@restaurant.user.email}>", :subject => "Review" , :from => @user.email)
  end
end
