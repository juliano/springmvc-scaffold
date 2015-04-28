name := "springmvc-scaffold"

version := "1.0"

jetty()

libraryDependencies ++= Seq(
    "org.springframework" % "spring-webmvc" % "4.1.3.RELEASE",
    "org.springframework" % "spring-orm" % "4.1.3.RELEASE",
    "javax.servlet" % "jstl" % "1.2",
    "org.hsqldb" % "hsqldb" % "2.3.2",
    "org.hibernate" % "hibernate-entitymanager" % "4.3.7.Final",
    "org.hibernate" % "hibernate-c3p0" % "4.3.7.Final",
    "org.hibernate" % "hibernate-validator" % "5.1.3.Final",
    "org.slf4j" % "slf4j-log4j12" % "1.7.7",
    "joda-time" % "joda-time" % "2.5",
    "org.sitemesh" % "sitemesh" % "3.0.0",
    "javax.servlet" % "servlet-api" % "2.5" % "provided",
    "javax.servlet.jsp" % "jsp-api" % "2.2" % "provided",
    "junit" % "junit" % "4.11" % "test",
    "org.mockito" % "mockito-all" % "1.10.8" % "test"
)
