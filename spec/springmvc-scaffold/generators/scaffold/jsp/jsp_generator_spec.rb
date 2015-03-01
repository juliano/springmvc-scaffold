require File.expand_path(File.dirname(__FILE__) + "/../../../../spec_helper")

describe JspGenerator do

  it "jsp template path" do
    expect(described_class.new("category", build_attributes).template_path).to eq "src/templates/views"
  end

  it "appends context to path" do
    expect(described_class.new("myModel", build_attributes).path("/edit")).to eq "${pageContext.request.contextPath}/myModels/edit"
  end

  context "simple model name" do
    let(:model) { "category" }
    let(:views_path) { File.join(Configuration::WEB_INF, "jsp", model.pluralize ) }

    before do
      generator = described_class.new(model, build_attributes)
      generator.build
    end
    after { FileUtils.remove_dir("src") }

    it "creates index view" do
      expect(File.exist?("#{views_path}/index.jsp")).to be true
    end

    it "creates show view" do
      expect(File.exist?("#{views_path}/show.jsp")).to be true
    end

    it "creates form view" do
      source = File.join(File.dirname(__FILE__), "templates", "form.jsp")
      destination = "#{Configuration::WEB_INF}/jsp/categories/form.jsp"
      exists_and_identical?(source, destination)
    end

    it "creates new view" do
      expect(File.exist?("#{views_path}/newCategory.jsp")).to be true
    end

    it "creates edit view" do
      expect(File.exist?("#{views_path}/edit.jsp")).to be true
    end
  end

end
