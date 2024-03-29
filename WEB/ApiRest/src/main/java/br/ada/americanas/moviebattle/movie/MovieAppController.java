package br.ada.americanas.moviebattle.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Controller web para atender as requisições. Não segue o padrão REST
 */
@Controller
@RequestMapping("/app/movies")
public class MovieAppController {

    private MovieService service;

    public MovieAppController(MovieService service) {
        this.service = service;
    }

    @GetMapping
    public String get(Model model) {
        model.addAttribute("movies", service.list());
        return "movie/list";
    }

    @GetMapping("/create")
    public String create(Model model) {
        // Fornece acesso a página html que representa o formulário. O cadastro acontece pelo POST
        model.addAttribute("movie", new Movie());
        return "movie/form";
    }

    @GetMapping("/edit/{id}")
    public String edit(
            @PathVariable("id") Long id,
            Model model
    ) {
        Movie movie = service.findById(id).get();
        model.addAttribute("movie", movie);
        return "movie/form";
    }

    @GetMapping("/delete/{id}")
    public String delete(
            @PathVariable("id") Long id,
            Model model
    ) {
        service.delete(id);
        return "redirect:/app/movies";
    }

    @PostMapping
    public String save(@ModelAttribute Movie movie) {
        service.add(movie);
        return "redirect:/app/movies";
    }

}
