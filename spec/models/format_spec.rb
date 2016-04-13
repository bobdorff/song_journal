require 'rails_helper'
require 'spec_helper'

describe Format do 
  it { should have_many(:albums) }
end
