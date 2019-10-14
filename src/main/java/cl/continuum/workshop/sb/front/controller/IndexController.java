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
public class IndexController extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private ProductService service;

    @GetMapping({"/", "/index"})
    public ModelAndView index(Model model) {

        return new ModelAndView("index","model", getModel());
    }

    @GetMapping("search")
    public ModelAndView search(@RequestParam("name") String name){

        Product product = service.searchByName(name);
        addModel("product", product);
        return new ModelAndView("index","model", getModel());
    }


}
