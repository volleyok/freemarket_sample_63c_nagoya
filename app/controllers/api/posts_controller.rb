class Api::PostsController < ApplicationController
  def child
    @child_categories = Category.where('ancestry = ?', "#{params[:id]}")
    respond_to do |format|
      format.html
      format.json
    end
  end
  
  def grand_child
    unless params[:id].empty?
      id = "/" + "#{params[:id]}"
      @grand_child_categories = Category.where('ancestry LIKE(?)', "%#{id}")
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

end
