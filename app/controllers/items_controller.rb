class ItemsController < ApplicationController
  def index
  end
  def show
  end
  def new
    redirect_to new_user_session_path unless user_signed_in?
  end
  def create
  end
end
