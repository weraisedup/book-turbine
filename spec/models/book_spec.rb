require 'rails_helper'

describe Book do
  it 'does book' do
    Book.create(
      title: 'Derby Jones: The Woman Behind The Name That Changed The World',
      author: 'Emma Hyde',
      release_date: Date.today
    )
  end
end
