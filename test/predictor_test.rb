require 'test_helper'

class TestPredictor < Minitest::Test

  def setup
    @samples = [1, 1, 3, 5, 3, 3, 2, 1, 2, 3]
  end

  def test_predictor_run
    assert_equal Chao92::Predictor.run(@samples, 10).class, Float 
  end

  def test_predictor_more
    assert Chao92::Predictor.run(@samples, 5) < Chao92::Predictor.run(@samples, 20)
  end
  
end