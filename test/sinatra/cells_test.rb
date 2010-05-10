require File.join(File.dirname(__FILE__), '/../test_helper')


class SinatraCellsTest < ActiveSupport::TestCase
  context "A sinatra cell" do
    setup do
      Cell::Base.framework = :sinatra
    end
    
    should_eventually "respond to default_template_engine" do
      
    end
    
    context "invoking find_family_view_for" do
      setup do
        @views = File.join(File.dirname(__FILE__), '/../app/cells')
      end
      
      should "return play.html.erb" do
        assert_equal "bassist/play", cell(:bassist).find_family_view_for(:play, {:template_format => :html, :engine => :erb}, @views)
      end
      
      should "return nil when non-existent" do
        assert_nil cell(:bassist).find_family_view_for(:play, {:template_format => :js, :engine => :erb}, @views)
      end
      
      should "find inherited play.html.erb" do
        assert_equal "bassist/play", cell(:bad_guitarist  ).find_family_view_for(:play, {:template_format => :html, :engine => :erb}, @views)
      end
      
      should_eventually "return an already cached family view"
    end
    
  end   
end