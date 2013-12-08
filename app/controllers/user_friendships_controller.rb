class UserFriendshipsController < ApplicationController
  # http://teamtreehouse.com/library/building-social-features-in-ruby-on-rails-2/building-the-friendship-ui/creating-the-friendship-controller
  before_filter :authenticate_user!, only: [:new]

  def new

    if params[:friend_id]
      # find friend by friend_id
      @friend = User.where(profile_name: params[:friend_id]).first
      raise ActibeRecord::RecordNotFound if @friend.nil?
      # @user_friendship = current_user.user_friendships.new(friend: @friend)
      @user_friendship = UserFriendship.new(friend: @friend, user: current_user)
    else
      flash[:error] = "Friend Required"
    end

  rescue ActiveRecord::RecordNotFound

    render file: 'public/404', status: :not_found

  end

  def create

    if params[:user_friendship] && params[:user_friendship].has_key?(:friend_id)
      @friend = User.where(profile_name: params[:user_friendship][:friend_id]).first
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
