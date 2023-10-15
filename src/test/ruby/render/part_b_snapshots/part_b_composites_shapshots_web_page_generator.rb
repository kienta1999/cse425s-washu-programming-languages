require_relative '../core/test_snapshots_web_page_generator'
require_relative '../part_b/part_b_composites_info'

gen = TestSnapshotsWebPageGenerator.new(PartBCompositesInfo.new, "./part_b_composite_transform_scene_test.html", "Render Part B CompositeTransform and Scene", "part_b", is_complete: true)
gen.generate do |instance, eval_text|
  true
  # eval_text.include?('snow_person = ')
  # instance.instance_of?(CompositeTransform)
  # instance.instance_of?(Scene)
end
gen.teardown

