package cl.continuum.workshop.sb.front.service;

import cl.continuum.workshop.sb.front.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Service
public class ProductService {
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

        List<Product> products  = restTemplate.exchange(
                uri,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<List<Product>>(){}).getBody();

        return products;
    }

    public Product searchByName(String name){
        List<Product> products  = restTemplate.exchange(
                String.format("%s?name=%s", uri, name),
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<List<Product>>(){}).getBody();

        //get data from outside sources

        Product result  = restTemplate.getForObject(String.format("%s/%s", uri, products.get(0).getId()), Product.class);

        return result;
    }

    @Bean
    public RestTemplate restTemplate(RestTemplateBuilder builder){
        return builder.build();
    }

}
