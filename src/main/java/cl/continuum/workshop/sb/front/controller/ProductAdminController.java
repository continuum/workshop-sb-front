package cl.continuum.workshop.sb.front.controller;

import cl.continuum.workshop.sb.front.model.Product;
import cl.continuum.workshop.sb.front.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
public class ProductAdminController extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(ProductAdminController.class);

    @Autowired
    private ProductService service;

    @GetMapping("admin")
    public ModelAndView admin(Model model) {
        this.findAllProducts();
        return new ModelAndView("admin","model", getModel());
    }

    @PostMapping("create")
    public ModelAndView create(@RequestParam("name") String name, @RequestParam("price") Long price){
        service.create(name, price);
        this.findAllProducts();
        return new ModelAndView("admin","model", getModel());
    }

    //shouldn't do this, but bloody hell mate
    private void findAllProducts(){
        List<Product> products = service.findAll();
        addModel("products", products);
    }

}
