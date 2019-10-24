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
    
    
    func inserisciNumeri()->Int{
        //Finche l'array non è piena continuo a inserire i numeri
        var contatore = 0
        while contatore < array.count{
            array[contatore] = Int(arc4random_uniform(15)+1)
            //controlla se il numero è valido per lalgoritmo dei 15 
            contatore += 1
        }
        return 0
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

