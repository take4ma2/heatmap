# Statistic module
module Statistic
  # statistics main class
  class Statistic
    # @!attribute [rw] data
    #   the array data you want to obtain base statistics
    attr_accessor :data, :cleaned_data
    # @!attribute [rw] data_name
    #   the title of data array
    attr_reader :data_name
    # @!attribute [rw] z_scores
    #   the array of Z score
    attr_reader :z_scores

    def initialize(data:, data_name:)
      @data = data
      @data_name = data_name
      @cleaned_data = clensing
      @z_scores = calculate_z_scores
    end

    # calculate mean of clean data
    # @return [Float] mean
    def mean
      @cleaned_data.map(&:to_f).sum / n.to_f
    end

    # calculate clean data size
    # @return [Int] size of cleaned data
    def n
      @clensing_data.size
    end

    # calculate variance of clean data
    # @return [Float] variance of cleaned data
    def variance
      @cleaned_data.map{ |datum| deviation(datum) ** 2.0 }.sum / n.to_f
    end

    # calculate standard deviation of clean data
    # @return [Float] Standard Deviation of cleaned data
    def sd
      Math.sqrt(variance)
    end

    private

    # calculate Z score
    # @return [Float] Z score of each data
    def calcurate_z_scores
      @data.map{ |datum| datum.nil? ? nil : deviation(datum) / sd }
    end

    # calculate deviation from value to mean
    # @params [Float] datum one of data
    # @return [Float] Deviation
    def deviation(datum)
      datum.to_f - mean.to_f
    end

    # Data clensing method
    # 1) Data can accept interval scale or proportional scale
    # 2) Remove null to calculate mean, variance, sd
    def clensing
      @data.reject(&:nil?)
    end
  end
end
