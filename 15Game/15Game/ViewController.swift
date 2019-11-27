//
//  ViewController.swift
//  15Game
//
//  Created by LUCA BONORA on 22/11/2019.
//  Copyright © 2019 LUCA BONORA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bottoni: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        array = mischiaNumeri(difficolta: Int(1))
        inserisciMatriceGraficamente()
        sblocca()
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
    
    //Funzione per inserire i numeri graficamente
    func inserisciMatriceGraficamente(){
        for i in 0...bottoni!.count-1{
            switch array[i] {
            case 0:
                bottoni[i].setTitle("", for: .normal)
            default:
                bottoni[i].setTitle(String(array[i]), for: .normal)
            }
            
        }
        
    }
    
    
    func blocca(){
        for i in 0...bottoni.count-1{
            bottoni[i].isUserInteractionEnabled = false
        }
    }
    
    func sblocca(){
        for i in 0...bottoni.count-1{
            bottoni[i].isUserInteractionEnabled = false
        }
    }
    
    
    
    @IBAction func spostaNumero(_ sender: UIButton) {
        let posZero = array.firstIndex(of: 0)
        let pos = bottoni.firstIndex(of: sender)
        var eFinita : Bool
        switch pos {
        case posZero!+1,posZero!-1,posZero!+4,posZero!-4:
            array.swapAt(posZero!, pos!)
            eFinita = finisciPartita()
        default:
            eFinita = finisciPartita()
        }
        if eFinita == true{
            blocca()
        }
        inserisciMatriceGraficamente()
    }
    //DAFINIRE
    @IBAction func nuovaPartita(_ sender: Any) {
        array = mischiaNumeri(difficolta: 1)
        inserisciMatriceGraficamente()
        sblocca()
    }
    
    
}

