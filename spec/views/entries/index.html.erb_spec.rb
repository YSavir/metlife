require 'rails_helper'

RSpec.describe 'entries/index.html.erb', type: :view do
  it 'should render each given user entry' do
    user = create :user
    user_entries = create_list :entry, 3, user: user

    assign(:user_entries, user_entries)

    render

    user_entries.each do |entry|
      expect(rendered).to match entry.title
      expect(rendered).to match entry.body
    end
  end
end
