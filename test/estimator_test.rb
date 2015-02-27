require 'test_helper'

class TestEstimator < Minitest::Test

  def setup
    @estimator = Chao92::Estimator.new
    @samples = [1, 1, 3, 5, 3, 3, 2, 1, 2, 3]
  end

  def test_estimator_run
    assert_equal Chao92::Estimator.run(@samples).class, Float 
  end

  def test_estimator_sampling
    assert_equal @estimator.sampling(@samples), Chao92::Estimator.run(@samples)
  end
  
end
