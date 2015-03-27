package app.controllers;

import static org.springframework.web.bind.annotation.RequestMethod.DELETE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import app.models.Product;
import app.repositories.Products;
import app.repositories.Categories;

@Controller
public class ProductsController {

	private final Products products;
	private final Categories categories;

	@Autowired
	public ProductsController(final Products products, final Categories categories) {
		this.products = products;
		this.categories = categories;
	}

	@RequestMapping(value = "/products", method = GET)
	public ModelAndView index() {
		return new ModelAndView("products/index", "productList", products.all());
	}

	@RequestMapping(value = "/products/{id}", method = GET)
	public ModelAndView show(@PathVariable final Long id) {
		return new ModelAndView("products/show", "product", products.get(id));
	}

	@RequestMapping(value = "/products/new", method = GET)
	public ModelAndView newProduct() {
		ModelAndView model = new ModelAndView("products/newProduct", "product", new Product());
		model.addObject("categoryList", categories.all());
		return model;
	}

	@RequestMapping(value = "/products", method = POST)
	public ModelAndView create(@Valid final Product product, final BindingResult result) {
		ModelAndView model = new ModelAndView();
		if(result.hasErrors()) {
			model.setViewName("products/newProduct");
			model.addObject("categoryList", categories.all());
			return model;
		}

		products.add(product);
		model.setViewName("redirect:/products/{id}");
		model.addObject("id", product.getId());
		return model;
	}

	@RequestMapping(value = "/products/{id}/edit", method = GET)
	public ModelAndView edit(@PathVariable final Long id) {
		ModelAndView model = new ModelAndView("products/edit", "product", products.get(id));
		model.addObject("categoryList", categories.all());
		return model;
	}

	@RequestMapping(value = "/products/update", method = POST)
	public ModelAndView update(@Valid final Product product, final BindingResult result) {
		ModelAndView model = new ModelAndView();
		if(result.hasErrors()) {
			model.setViewName("products/edit");
			model.addObject("categoryList", categories.all());
			return model;
		}

		products.update(product);
		model.setViewName("redirect:/products/{id}");
		model.addObject("id", product.getId());
		return model;
	}

	@RequestMapping(value = "/products/{id}", method = DELETE)
	public String destroy(@PathVariable final Long id) {
		products.remove(products.get(id));
		return "redirect:/products";
	}
}
