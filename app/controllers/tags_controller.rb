class TagsController < ApplicationController
  before_action :set_tag, only: [:show]

def index
  @tags = Tag.order(:name)
end

def show
end


  private

  def set_tag
    @tag = Tag.find(params["id"])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
