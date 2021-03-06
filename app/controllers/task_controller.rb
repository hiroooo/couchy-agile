class TaskController < ApplicationController
  def create
    story = Story.find_by_title(params[:story])
    card = Task.new :story => story, :title => params[:title], :status => params[:status], :developer => params[:developer], :description => params[:description]
    card.save
    render  :json => {:id=>card.id}
  end

  def index
    render :json => Task.all
  end

  def update
    task = Task.find_by_id(params[:id])
    if task.status != params[:status]
      task.update_status(params[:status])
    end
    render :json => {}
  end
end