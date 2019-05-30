class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :]

def index
  @tags = Tag.order(:name)
end

def show
end

def new
  @tag = Tag.new
end

def create
  
  @tag = Tag.new(tag_params)
  if @tag.valid?
    @tag.save
    redirect_to tags_path
  else
    #flash[:errors] = @tag.errors.messages[:name]
    flash[:errors] = @tag.errors.full_messages
    redirect_to new_tag_path
  end
  
end

def edit
end

def update
  @tag.update(tag_params)
  if @tag.valid?
    redirect_to tags_path
  else
    #flash[:errors] = @tag.errors.messages[:name]
    flash[:errors] = @tag.errors.full_messages  # when are these errors overwritten?
    redirect_to new_tag_path
  end
end


def destroy
  
  flash[:errors] = "#{@tag.name} has been deleted AND it's task tags are gone too!"
  task_tags = TaskTag.all.select{|t| t.tag_id == @tag.id}

 
  if task_tags.class == Array
    task_tags.each{|tt| tt.destroy}
  end
  @tag.destroy
  
  redirect_to tags_path
end

  private

  def set_tag
    @tag = Tag.find(params["id"])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
