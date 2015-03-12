module Chao92

  # == Estimator
  #
  # Used to estimate the total number of species
  #
  # A minimal usage could be:
  #
  #   Chao92::Estimator.run(samples) # => the estimator of the samples
  #
  class Estimator

    def initialize
      @samples = []
      @observed = {}
      @ff = {}
    end

    def self.run(samples)
      Estimator.new.sampling(samples)
    end

    def sampling(samples)
      @samples += samples
      update()
      estimate()
      @N
    end

    # Show the samples
    #
    def show
      @samples
    end

    private
    def update
      @observed = @samples.to_hash
      @ff = @observed.to_inverse
    end

    def estimate
      @turing_estimator = if @ff[1] 
                            1 - @ff[1].to_f / @samples.size 
                          else         
                            1      
                          end

      @N1 = @observed.size / @turing_estimator

      tmp = 0.0
      tmp = @samples.size.times do |x| 
        tmp += x * (x - 1) * @ff[x] if @ff[x]
      end

      @cv_estimator = [@N1 * tmp / (@samples.size.to_f * (@samples.size - 1).to_f - 1), 0.0].max

      @N = @N1 + @samples.size * (1 - @turing_estimator) / @turing_estimator * @cv_estimator
    end

  end

end
