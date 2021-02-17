module Statistic
  module Clustering
    # Euclidean Mean module
    module EuclideanMean
      # Calculate mean between p and q in euclidean space.
      # @param [Array] ps array of data
      # @param [Array] qs array of data
      # @return [nil] if dimension missmatch
      # @return [Float] mean
      def mean(ps, qs)
        return nil unless ps.size == qs.size

        d_square = 0.0
        ps.each_with_index { |p, i| d_square += (p - q[i])**2.0 }
        Math.sqrt(d_square)
      end
    end
  end
end
