module CsvParser
  require 'csv'

  QUOTES_ARR = CSV.foreach("#{Rails.root}/quotes.csv", headers: true).to_a

  def self.sample_quotes
    QUOTES_ARR.sample.to_h
    # total_rows = CSV.foreach("#{Rails.root}/quotes.csv", headers: true).count
    # random = rand(total_rows)
    # { status: :ok, message: random }
  end
  
end