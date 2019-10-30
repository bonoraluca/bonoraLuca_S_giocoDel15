//
//  ViewController.swift
//  giocoDel15
//
//  Created by LUCA BONORA on 23/10/2019.
//  Copyright © 2019 LUCA BONORA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Variabili globali
    var array : [Int] = []
    let numeriOrdinati = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    
    //Funzione per inserire i numeri
    func inserisciNumeri(){
        //Finche l'array non è piena continuo a inserire i numeri
        var pos = 0
        var appoggio = 0
        
        for pos_ in 1...15{
            appoggio = pos
            pos = Int(arc4random_uniform(15))
            switch appoggio {
            case pos :
                pos = Int(arc4random_uniform(15))
            default:
                array[pos] = pos_
            }
        }
        controllaSeRisolvibile()
    }
    
    //Funzione per controllare se è risolvibile il gioco
    func controllaSeRisolvibile(){
        var N : [Int] = []
        var N_ : Int = 0
        
        for pos in 0...15{
            for posizioneInv in 15...0{
                if array[posizioneInv]<array[pos]{
                    N[pos] += 1
                }
            }
        }
        
        for pos_ in 0...Int(N.count){
            N_ += N[pos_]
        }
        
        if Double(N_%2) > 0{
            inserisciNumeri()
        }
    }
    
    //Funzione per controllare se hai finito la partita
    func finisciPartita()->Bool{
        
        if  array == numeriOrdinati{
            return true
        }else{
            return false
        }
    }
    
}

