# class EvalTextImageSubPathPair
#   attr_reader :eval_text, :image_sub_path
#   def initialize(eval_text, image_sub_path)
#     @eval_text = eval_text
#     @image_sub_path = image_sub_path
#   end
# end

EvalTextImageSubPathPair = Struct.new(:eval_text, :image_sub_path)