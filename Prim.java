/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.util.*;

/**
 *
 * @author levantsi
 */
public class Prim {
    private boolean[] mukana;
    private ArrayList<Kaari> F;
    private PriorityQueue<Kaari> keko;
    private ArrayList<Kaari>[] verkko;
    
    public Prim(int n) {
        mukana = new boolean[n + 1];
        F = new ArrayList<>();
        keko = new PriorityQueue<>();
        verkko = new ArrayList[n + 1];
        
        for (int i = 0; i < verkko.length; i++) {
            verkko[i] = new ArrayList<>();
        }
    }
    
    public void lisaaKaari(int a, int b, int p) {
        verkko[a].add(new Kaari(a,b,p));
        verkko[b].add(new Kaari(b,a,p));
    }
    
    public ArrayList<Kaari> muodosta(int alku) {
        mukana[alku] = true;
        
        for (Kaari kaari : verkko[alku]) {
            keko.add(new Kaari(alku, kaari.loppu, kaari.paino));
        }
            
        while (!keko.isEmpty()) {
            Kaari kevein = keko.poll();
            int u = kevein.loppu;
            
            if (mukana[u]) continue;
            
            F.add(new Kaari(kevein.alku,u,kevein.paino));
            mukana[u] = true;
            for (Kaari kaari : verkko[u]) {
                if (!mukana[kaari.loppu]) {
                    keko.add(new Kaari(u, kaari.loppu, kaari.paino));
                }
            }
        }
        
        return F;
    }
}
