class RepositoryGenerator < BaseScaffold

  def build
    define_source_paths
    template("repository.erb", Configuration.main_class_path(Configuration.repositories_package, "#{repository_class_name}.java"))
    template("repository_test.erb", Configuration.test_class_path(Configuration.repositories_package, "#{repository_test_class_name}.java"))
  end

  def template_path
    "src/templates/repositories"
  end

  def orm_import
    return "org.hibernate.Session" if Configuration.hibernate?
    "javax.persistence.EntityManager"
  end

  def orm_parameter_name
    return "session" if Configuration.hibernate?
    "entityManager"
  end

  def orm_class
    orm_parameter_name.camelize
  end

  def source_root
    File.join(File.dirname(__FILE__), "templates")
  end
end
