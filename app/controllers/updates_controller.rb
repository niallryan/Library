class UpdatesController < ApplicationController
  before_filter :authenticate_user!
  # GET /updates
  # GET /updates.json
  def index
    # Reverse order of list of Updates so newest appears at the top of the page
    @updates = Update.order('created_at desc').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @updates }
    end
  end

  # GET /updates/1
  # GET /updates/1.json
  def show
    @update = Update.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @update }
    end
  end

  # GET /updates/new
  # GET /updates/new.json
  def new
    # scope to current_user
    @update = current_user.updates.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @update }
    end
  end

  # GET /updates/1/edit
  def edit
    @update = Update.find(params[:id])
  end

  # POST /updates
  # POST /updates.json
  def create
    # http://teamtreehouse.com/library/building-social-features-in-ruby-on-rails-2/creating-friendships/what-is-a-join-table
    # scope to current_user
    @update = current_user.updates.new(params[:update])

    respond_to do |format|
      if @update.save
        format.html { redirect_to @update, notice: 'Update was successfully created.' }
        format.json { render json: @update, status: :created, location: @update }
      else
        format.html { render action: "new" }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /updates/1
  # PUT /updates/1.json
  def update
    # http://teamtreehouse.com/library/building-social-features-in-ruby-on-rails-2/creating-friendships/what-is-a-join-table
    @update = current_user.updates.find(params[:id])
    if params[:update] && params[:update].has_key?(:user_id)
      params[:update].delete(:user_id)
    end
    respond_to do |format|
      if @update.update_attributes(params[:update])
        format.html { redirect_to @update, notice: 'Update was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /updates/1
  # DELETE /updates/1.json
  def destroy
    @update = Update.find(params[:id])
    @update.destroy

    respond_to do |format|
      format.html { redirect_to updates_url }
      format.json { head :no_content }
    end
  end
end
