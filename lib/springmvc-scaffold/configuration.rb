class Configuration
  MAIN_SRC = "src/main/java"
  WEB_APP = "src/main/webapp"
  WEB_INF = "#{WEB_APP}/WEB-INF"
  MAIN_RESOURCES = "src/main/resources"
  META_INF = "#{WEB_APP}/META-INF"
  TEST_SRC = "src/test/java"
  TEST_RESOURCES = "src/test/resources"
  FILENAME = "#{META_INF}/springmvc-scaffold.properties"

  def self.config
    YAML.load_file FILENAME
  end

  def self.package
    config["package"] ? config["package"] : 'app'
  end

  def self.models_package
    config["models_package"] ? config["models_package"] : 'models'
  end

  def self.controllers_package
    config["controllers_package"] ? config["controllers_package"] : 'controllers'
  end

  def self.repositories_package
    config["repositories_package"] ? config["repositories_package"] : 'repositories'
  end

  def self.full_models_package
    "#{package}.#{models_package}"
  end

  def self.orm
    config["orm"] ? config["orm"] : 'jpa'
  end

  def self.hibernate?
    orm.eql? "hibernate"
  end

  def self.main_class_path(*path)
    File.join(MAIN_SRC, package.gsub(".", File::Separator), path)
  end

  def self.test_class_path(*path)
    File.join(TEST_SRC, package.gsub(".", File::Separator), path)
  end
end
