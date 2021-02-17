require 'matrix'
module Statistic
  module Clustering
    # Cluster
    class Cluster
      attr_accessor :ns, :matrix, :ids

      # distance between vector x and vector y
      # @param [Vector] x vector 1
      # @param [Vector] y vector 2
      # @return [Float] distance(-)
      def self.distance(x, y)
        sum = 0.0
        x.zip(y).each { |e1, e2| sum += (e1 - e2)**2.0 }
        Math.sqrt(sum)
      end

      def initialize(ns, ids)
        @ns = ns
        @ids = ids
        vectorize
      end

      # merge other cluster
      def merge(cluster)
        @ns.concat(cluster.ns)
        ids << cluster.ids
        vectorize
        ids
      end

      # ward method distance
      # @param [Static::Clustering::Cluster] cluster cluster class instance
      # @return [Float] Ward method distance(-)
      def ward_method_distance(cluster)
        coef = n_size * cluster.n_size / (n_size + cluster.n_size)
        dist = Statistic::Clustering::Cluster.distance(centroid, cluster.centroid)
        coef * dist
      end

      # size of vectors
      def n_size
        @matrix.row_size
      end

      # Calcurate cluster centroid by included points
      # @return vector of centroid
      def centroid
        @matrix.column_vectors.map { |column| mean(column) }
      end

      private

      # Vectorization
      def vectorize
        @matrix = Matrix.rows(@ns)
      end

      # mean of vector elements
      # @param [Vector] vector vector of matrix
      # @return [Float] mean of vector elements
      def mean(vector)
        vector.to_a.sum / vector.size.to_f
      end
    end
  end
end
