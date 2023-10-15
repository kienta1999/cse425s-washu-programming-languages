require_relative '../core/test_snapshots_web_page_generator'
require_relative 'home_heart_info'

gen = TestSnapshotsWebPageGenerator.new(HomeHeartInfo.new, "./home_heart_test.html", "Render Home Heart", "home_is_where_the_heart_is")
gen.generate
gen.teardown

