require 'rails_helper'
require 'spec_helper'

describe ListeningSession do
  it { should belong_to(:user) }
  it { should belong_to(:album) } 
end
