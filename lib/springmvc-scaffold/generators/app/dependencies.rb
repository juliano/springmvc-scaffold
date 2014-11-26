class Dependencies

  def self.compile_scope
    hibernate_version = "4.0.1.Final"
    spring_version = "4.1.2.RELEASE"
    [Dependency.new("org.springframework", "spring-core", spring_version),
     Dependency.new("org.springframework", "spring-web", spring_version),
     Dependency.new("org.springframework", "spring-webmvc", spring_version),
     Dependency.new("javax.servlet", "jstl", "1.2"),
     Dependency.new("org.hsqldb", "hsqldb", "2.2.8"),
     Dependency.new("org.hibernate", "hibernate-entitymanager", hibernate_version),
     Dependency.new("org.hibernate", "hibernate-c3p0", hibernate_version),
     Dependency.new("org.hibernate", "hibernate-validator", "4.2.0.Final"),
     Dependency.new("joda-time", "joda-time", "2.0")]
  end

  def self.test_scope
    [Dependency.new("junit", "junit", "4.10"),
     Dependency.new("org.mockito", "mockito-all", "1.9.0"),
     Dependency.new("org.hamcrest", "hamcrest-all", "1.1")]
  end

  def self.provided_scope
    [Dependency.new("javax.servlet", "servlet-api", "2.5"), Dependency.new("javax.servlet.jsp", "jsp-api", "2.1")]
  end
end
