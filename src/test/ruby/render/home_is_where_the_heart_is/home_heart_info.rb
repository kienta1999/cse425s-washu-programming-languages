require_relative '../core/eval_text_image_sub_path_pair'
require_relative '../../../../main/ruby/render/home_is_where_the_heart_is/heart'
require_relative '../../../../main/ruby/render/home_is_where_the_heart_is/home'

class HomeHeartInfo
  def eval_text_image_sub_path_pairs
    [EvalTextImageSubPathPair.new('Home.new() # note: does NOT need to be exact match', 'Home'),
     EvalTextImageSubPathPair.new('Heart.new() # note: does NOT need to be exact', 'Heart'),]
  end
end