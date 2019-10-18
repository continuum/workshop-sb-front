package cl.continuum.workshop.sb.front.service;

import cl.continuum.workshop.sb.front.controller.IndexController;
import cl.continuum.workshop.sb.front.model.Product;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {

    private static Logger logger = LoggerFactory.getLogger(ProductService.class);

    final String uri = "http://localhost:8080/api/v1/products";

    @Autowired
    RestTemplate restTemplate;

    public Product create(String name, Long price){
        Product newProduct = new Product();
        newProduct.setName(name);
        newProduct.setPrice(price);
       return restTemplate.postForObject( uri, newProduct, Product.class);
    }

    public List<Product> findAll(){
        List<Product> products = new ArrayList<>();
        try {
            products  = restTemplate.exchange(
                    uri,
                    HttpMethod.GET,
                    null,
                    new ParameterizedTypeReference<List<Product>>(){}).getBody();
        } catch(Exception ex) {
        }
        return products;
    }

    public List<Product> searchByName(String name){
        List<Product> result = new ArrayList<>();
        try {
            List<Product> products  = restTemplate.exchange(
                    String.format("%s?name=%s", uri, name),
                    HttpMethod.GET,
                    null,
                    new ParameterizedTypeReference<List<Product>>(){}).getBody();

            for (Product p : products) {
                result.add(restTemplate.getForObject(String.format("%s/%s", uri, p.getId()), Product.class));
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }

    @Bean
    public RestTemplate restTemplate(RestTemplateBuilder builder){
        return builder.build();
    }
}
