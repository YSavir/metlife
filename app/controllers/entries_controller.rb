class EntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_entries = current_user.entries
  end

  def new
    @entry = Entry.new
  end
end
