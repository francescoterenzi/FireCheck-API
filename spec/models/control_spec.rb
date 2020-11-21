require 'rails_helper'

RSpec.describe Control, type: :model do
  it { should belong_to(:extinguisher) }
end
