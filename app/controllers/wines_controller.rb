class WinesController < ApplicationController

    def new
        @wine = Wine.new
    end


end
