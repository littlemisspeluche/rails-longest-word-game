class GamesController < ApplicationController
  def new
   @letters = ("A".."Z").to_a.sample(10)
  end

  def score
    counter = 0
    params[:guess].split("").each do |el|
      if params[:letters].split.join.include?(el.upcase)
        counter += 1
      end
    end
    if params[:guess].length == counter
      # if its true then we ask API
      url = "https://wagon-dictionary.herokuapp.com/#{params[:guess]}"
      answer = JSON.parse(open(url).read)
      answer["found"] ? @msg = "You won!" : @msg = "You lost!"
    else
      # do smth
      @msg = "letters not match"
    end
  end
end
