module FormHelper
  def setup_tree(thing)
    thing.tree ||= Tree.new
    thing
  end
end