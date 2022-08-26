module CsvParser
  require 'csv'

  QUOTES_ARR = CSV.foreach("#{Rails.root}/quotes.csv", headers: true).to_a

  def self.sample_quotes
    QUOTES_ARR.sample.to_h
  end
  
end