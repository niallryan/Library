class BookListsController < ApplicationController
  # GET /book_lists
  # GET /book_lists.json
  def index
    @book_lists = BookList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book_lists }
    end
  end

  # GET /book_lists/1
  # GET /book_lists/1.json
  def show
    @book_list = BookList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book_list }
    end
  end

  # GET /book_lists/new
  # GET /book_lists/new.json
  def new
    @book_list = current_user.book_lists.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book_list }
    end
  end

  # GET /book_lists/1/edit
  def edit
    @book_list = BookList.find(params[:id])
  end

  # POST /book_lists
  # POST /book_lists.json
  def create
    @book_list = current_user.book_lists.new(params[:book_list])

    respond_to do |format|
      if @book_list.save
        format.html { redirect_to @book_list, notice: 'Book list was successfully created.' }
        format.json { render json: @book_list, status: :created, location: @book_list }
      else
        format.html { render action: "new" }
        format.json { render json: @book_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /book_lists/1
  # PUT /book_lists/1.json
  def update
    @book_list = BookList.find(params[:id])

    # https://gist.github.com/arelenglish/6110438
    @book_id = params[:book_list].delete(:books)

    if @book_id
      @book_list_item = BookListItem.create(:book_id => @book_id, :book_list_id => @book_list.id)
    end

    # Update book_ids
    # This works if I change respond block below to @book_list.save:
    # @book_list.book_ids += [2, 3]
    # This doesn't work
    # @book_list.book_ids += [@book_list_item.book_id]
    # @book_list_item not being created properly

    respond_to do |format|
      if @book_list.update_attributes(params[:book_list])
        format.html { redirect_to @book_list, notice: 'Book list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_lists/1
  # DELETE /book_lists/1.json
  def destroy
    @book_list = BookList.find(params[:id])
    @book_list.destroy

    respond_to do |format|
      format.html { redirect_to book_lists_url }
      format.json { head :no_content }
    end
  end
end
