class AuthorsController < ApplicationController

  def author_information
    @input = params[:search_string]
    @result = AuthorInfo.getInfo(@input.to_s)
  end

end
