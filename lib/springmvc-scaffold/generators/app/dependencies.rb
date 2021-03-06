class Dependencies

  def self.compile_scope
    hibernate_version = "4.3.7.Final"
    [Dependency.new("org.springframework", "spring-webmvc", "4.1.3.RELEASE"),
     Dependency.new("org.springframework", "spring-orm", "4.1.3.RELEASE"),
     Dependency.new("javax.servlet", "jstl", "1.2"),
     Dependency.new("org.hsqldb", "hsqldb", "2.3.2"),
     Dependency.new("org.hibernate", "hibernate-entitymanager", hibernate_version),
     Dependency.new("org.hibernate", "hibernate-c3p0", hibernate_version),
     Dependency.new("org.hibernate", "hibernate-validator", "5.1.3.Final"),
     Dependency.new("org.slf4j", "slf4j-log4j12", "1.7.7"),
     Dependency.new("joda-time", "joda-time", "2.5"),
     Dependency.new("org.sitemesh", "sitemesh", "3.0.0")]
  end

  def self.test_scope
    [Dependency.new("junit", "junit", "4.11"),
     Dependency.new("org.mockito", "mockito-all", "1.10.8")]
  end

  def self.provided_scope
    [Dependency.new("javax.servlet", "servlet-api", "2.5"),
     Dependency.new("javax.servlet.jsp", "jsp-api", "2.2")]
  end
end
