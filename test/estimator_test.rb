require 'test_helper'

describe Chao92::Estimator do

  before do
    @samples = [1, 1, 3, 5, 3, 3, 2, 1, 2, 3]
  end

  it "test_estimator" do
    assert_equal Chao92::Estimator.run(@samples), 1 
  end
  
end