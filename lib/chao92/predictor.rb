module Chao92

  class Predictor

    def initialize
      @samples = []
      @observed = {}
      @ff = {}
    end

    def self.run(samples, next_number)
      Predictor.new.predicting(samples, next_number)
    end

    def predicting(samples, next_number)
      @samples += samples
      update()
      predict(next_number)
    end

    private
    def update
      @observed = @samples.to_hash
      @ff = @observed.to_inverse
    end

    def predict(next_number)
      @w = @ff[1] ** 2 / (2.0 * @ff[2]) 
      @turing_estimator = if @ff[1] 
                            1 - @ff[1].to_f / @samples.size 
                          else         
                            1      
                          end
      @S2 = @w * (1 - (1 - (1 - @turing_estimator) / @w ) ** next_number )
    end

  end

end