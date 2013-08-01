module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  def sorted(para)
    "hilite" if params[:sort]==para
  end
end
