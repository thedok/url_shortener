class AddCounterColumn < ActiveRecord::Migration
  def change
    add_column(:urls, :counter, :integer)
  end
end
