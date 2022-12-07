# if @note.persisted?
#   json.form render(partial: "notes/form", formats: :html, locals: {colocation: @colocation, note: Note.new})
#   json.inserted_item render(partial: "restaurants/review", formats: :html, locals: {review: @review})
# else
#   json.form render(partial: "reviews/form", formats: :html, locals: {restaurant: @restaurant, review: @review})
# end
