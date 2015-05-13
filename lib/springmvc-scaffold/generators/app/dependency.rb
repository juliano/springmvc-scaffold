class Dependency

  attr_accessor :group, :name, :version

  def initialize(group, name, version=nil)
    @group = group
    @name = name
    @version = version
  end

end
