require 'rails_helper'

RSpec.describe Extinguisher, type: :model do
  it { should validate_presence_of(:matricola) }
end
