require_relative '../core/test_snapshots_web_page_generator'
require_relative '../part_c/part_c_info'

gen = TestSnapshotsWebPageGenerator.new(PartCInfo.new, "./part_c_test.html", "Render Part C", "part_c", is_complete: true)
gen.generate do |instance, eval_text|
  true
  # eval_text.include?('move: ')
  # instance.instance_of?(ConvexPolygon)
end
gen.teardown

