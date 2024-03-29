package br.ada.americanas.moviebattle.battle;

import br.ada.americanas.moviebattle.movie.Movie;
import br.ada.americanas.moviebattle.player.Player;
import br.ada.americanas.moviebattle.player.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/battles")
public class BattleRestController {


    private BattleService battleService;
    private PlayerService playerService;

    @Autowired
    public BattleRestController(BattleService battleService, PlayerService playerService) {
        this.battleService = battleService;
        this.playerService = playerService;
    }

//    @PostMapping(
//            consumes = {MediaType.APPLICATION_JSON_VALUE},
//            produces = {MediaType.APPLICATION_JSON_VALUE}
//    )
//    public Battle create(@RequestBody Battle battle) {
//        return this.service.add(battle);
//    }
    @PostMapping(
            consumes = {MediaType.APPLICATION_JSON_VALUE},
            produces = {MediaType.APPLICATION_JSON_VALUE}
    )
    public Battle create(@RequestBody Player player) {
        Player player_banco = this.playerService.findById(player.getId()).get();
        return this.battleService.create(player_banco);
    }
    @PutMapping(
            value = "/{id}",
            consumes = {MediaType.APPLICATION_JSON_VALUE},
            produces = {MediaType.APPLICATION_JSON_VALUE}
    )
    public boolean answer(
            @PathVariable("id") Long id,
            @RequestBody Movie movie
    ) {
            Battle battle = battleService.find(id).get();
            battleService.answer(battle, movie);
            boolean answer = battle.getHit();
            return answer;
    }

    @GetMapping(produces = {MediaType.APPLICATION_JSON_VALUE})
    public Iterable<Battle> list() {
        return battleService.list();
    }

    @GetMapping(
            value = "/{id}",
            produces = {MediaType.APPLICATION_JSON_VALUE}
    )
    public Battle get(@PathVariable("id") Long id) {
        Battle battle = battleService.find(id).get();
        System.out.println(battle);
        return battle;
    }

    @DeleteMapping(
            value = "/{id}",
            produces = {MediaType.APPLICATION_JSON_VALUE}
    )
    public Battle delete(@PathVariable("id") Long id) {
        return battleService.delete(id);
    }

}