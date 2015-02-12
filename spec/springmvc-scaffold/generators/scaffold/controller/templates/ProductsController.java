package app.controllers;

import static org.springframework.web.bind.annotation.RequestMethod.DELETE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import static org.springframework.web.bind.annotation.RequestMethod.PUT;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		return new ModelAndView("products/newProduct", "product", new Product());
	}

	@RequestMapping(value = "/products", method = POST)
	public String create(@Valid final Product product, final BindingResult result,
			final RedirectAttributes attributes) {
		if(result.hasErrors()) {
			return "products/newProduct";
		}
		products.add(product);
		attributes.addAttribute("id", product.getId());
		return "redirect:/products/{id}";
	}

	@RequestMapping(value = "/products/{id}/edit", method = GET)
	public ModelAndView edit(@PathVariable final Long id) {
		return new ModelAndView("products/edit", "product", products.get(id));
	}

	@RequestMapping(value = "/products", method = PUT)
	public String update(final Product product, final RedirectAttributes attributes) {
		products.update(product);
		attributes.addAttribute("id", product.getId());
		return "redirect:/products/{id}";
	}

	@RequestMapping(value = "/products/{id}", method = DELETE)
	public String destroy(@PathVariable final Long id) {
		products.remove(products.get(id));
		return "redirect:/products";
	}
}
