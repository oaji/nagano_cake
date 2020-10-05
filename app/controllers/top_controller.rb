class TopController < ApplicationController


end

def search
	@model = params["search"]["model"]
	@content = params["search"]["content"]
	@dates = search_for(@how, @models, @content)
end

private
def match(model,content)
	if model == 'genre'
		Genre.where(item: content)
	elsif model == 'item'
		item.where(title: content)
	end
end

def partical(model, content)
 if model == 'item'
