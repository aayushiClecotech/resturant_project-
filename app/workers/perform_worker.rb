class PerformWorker
  include Sidekiq::Worker
  sidekiq_options retry: false


  def perform(user_id, review_id, restaurant_id)
     
    user = User.find_by(id: user_id)
    review = Review.find_by(id: review_id)
    restaurant = Restaurant.find_by(id: restaurant_id)
    ReviewMailer.with(user: user, review: review, restaurant: restaurant).review_email.deliver_now
  end
end
