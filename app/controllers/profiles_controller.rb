class ProfilesController < ApplicationController

  # http://teamtreehouse.com/library/build-a-simple-ruby-on-rails-application/building-the-profile-page/creating-the-profiles-controller-2

  def show
    @user = User.find_by_profile_name(params[:id])

    if @user
      render action: :show
      @updates = @user.updates.all
      @books = @user.books.all
    else
      render file: 'public/404', status: 404, formats: [:html]
    end

  end

end
