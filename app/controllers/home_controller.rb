class HomeController < ApplicationController

  def index
    @cquery = ""
    @tquery = ""
    if params[:condition_query].present?
      @cquery = params[:condition_query]
      responses = AlternateName.search(@cquery).records
      @conditions = []
      responses.each do |response|
        response.medical_conditions.each do |condition|
          condition.name = HomeController::hilite(condition.name, @cquery)
          @conditions << condition
        end
      end
    else
      @conditions = MedicalCondition.all
    end
    if params[:therapy_query].present?
      @tquery = params[:therapy_query]
      @therapies = MedicalTherapy.search(@tquery).records
    else
      @therapies = MedicalTherapy.all
    end
  end


  def self.hilite(string, query = "")
    if query != ""
      string.gsub(query, "<span class='hi-lite'>#{query}</span>").html_safe
    else
      string
    end
  end

end
