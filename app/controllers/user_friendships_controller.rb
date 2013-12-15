class UserFriendshipsController < ApplicationController
  # http://teamtreehouse.com/library/building-social-features-in-ruby-on-rails-2/building-the-friendship-ui/creating-the-friendship-controller
  # http://teamtreehouse.com/library/building-social-features-in-ruby-on-rails-2/adding-state/test-factories-2
  before_filter :authenticate_user!

  def new

    if params[:friend_id]
      # find friend by friend_id
      @friend = User.where(profile_name: params[:friend_id]).first
      raise ActiveRecord::RecordNotFound if @friend.nil?
      @user_friendship = UserFriendship.new(friend: @friend, user: current_user)
    else
      flash[:error] = "Friend Required"
    end

  rescue ActiveRecord::RecordNotFound

    render file: 'public/404', status: :not_found

  end

  def create

    # make sure there's a user_id and a friend_id to pass in
    if params[:user_friendship] && params[:user_friendship].has_key?(:friend_id)
      # get friend
      @friend = User.where(profile_name: params[:user_friendship][:friend_id]).first
      #create friendship with user id and friend id
      @user_friendship = UserFriendship.new(friend: @friend, user: current_user)
      @user_friendship.save
      redirect_to profile_path(@friend)
      flash[:success] = "Friend Added"
    else
      flash[:error] = "Friend Required"
      redirect_to root_path
    end

  end

  def index
    @user_friendships = current_user.user_friendships.all
  end

end
