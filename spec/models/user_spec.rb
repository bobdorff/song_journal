require 'rails_helper'
require 'spec_helper'

describe User do 
  it {should have_many(:listening_sessions) }
end
