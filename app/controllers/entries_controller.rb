class EntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_entries = current_user.entries
  end

  def new
    @entry = Entry.new
  end

  def create
    entry = Entry.create(created_entry_data)

    redirect_to entries_path(entry)
  end

  private

  def entry_params
    params.permit(:title, :body)
  end

  def automated_new_entry_data
    {
      user: current_user,
      posted_at: Time.current
    }
  end

  def created_entry_data
    entry_params.merge(automated_new_entry_data)
  end
end
