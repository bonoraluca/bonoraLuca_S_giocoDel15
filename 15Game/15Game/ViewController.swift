//
//  ViewController.swift
//  15Game
//
//  Created by LUCA BONORA on 22/11/2019.
//  Copyright © 2019 LUCA BONORA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn_0: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Variabili globali
    var array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0]
    let numeriOrdinati = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0]
    
    //Funzione per mischiare i numeri nella matrice
    func mischiaNumeri(difficolta:Int)->[Int]{
        
        let possibileSpostamento = [-4,+4,-1,+1]
        var spostamento = possibileSpostamento.randomElement()
        
        for _ in 0...difficolta{
            let pos = array.firstIndex(of: 0)
            while !((0...15).contains(pos!+spostamento!)){
                spostamento = possibileSpostamento.randomElement()
            }
            array.swapAt(pos!, pos!+spostamento!)
        }
        return array
    }
    
    //Funzione per controllare se hai finito la partita
    func finisciPartita()->Bool{
        
        if  array == numeriOrdinati{
            return true
        }else{
            return false
        }
    }
    
    func inserisciMatriceGraficamente(){
        var nomeButton : String
        for i in 0...15{
            nomeButton = "btn_" + String(i)
            //nomeButton.setTitle
        }
    }

}

