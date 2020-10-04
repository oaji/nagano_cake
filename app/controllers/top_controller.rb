class TopController < ApplicationController


end

def search
	@model = params["search"]["model"]
	@content = params["search"]["content"]
	@dates = search_for(@how, @models, @content)
end

private
def match(model,content)
	if model == 'user'
		customer.where(name: content)
	elsif model == 'book'
		item.where(title: content)
	end
end
