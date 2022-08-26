class QuotesController < ApplicationController
  require 'csv_parser'
  include CsvParser

  def index
    @sampled_quote = CsvParser.sample_quotes
    respond_to do |format|
      format.html
      format.json { render json: @sampled_quote }
      format.xml { render xml: @sampled_quote }
    end
  end
end
