require 'rails_helper'
require 'spec_helper'
describe Album do 
  it { should have_many(:listening_sessions) }
  it { should belong_to(:format) }
end
