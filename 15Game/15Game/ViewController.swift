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
    @IBOutlet weak var stp_difficolta: UIStepper!
    @IBOutlet weak var lbl_difficolta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        blocca()
        nuovaPartita((Any).self)
    }
    
    //Variabili globali
    var array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0]
    let numeriOrdinati = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0]
    var difficolta = 0
    
    //Funzione per mischiare i numeri nella matrice
    func mischiaNumeri(difficolta:Int)->[Int]{
        
        let possibileSpostamento = [-4,+4,-1,+1]
        var spostamento = possibileSpostamento.randomElement()
        
        for _ in 0...difficolta{
            spostamento = possibileSpostamento.randomElement()
            let pos = array.firstIndex(of: 0)
            while !((0...15).contains(pos!+spostamento!)){
                switch pos {
                    case 3,7,11:
                        while spostamento! == 1{
                            spostamento = possibileSpostamento.randomElement()
                    }
                    case 4,8,12:
                        while spostamento! == -1{
                            spostamento = possibileSpostamento.randomElement()
                    }
                    default:
                        if (0...15).contains(pos!+spostamento!){
                            array.swapAt(pos!, pos!+spostamento!)
                    }
            }
        }
            array.swapAt(pos!, pos!+spostamento!)
    }
        return array
}
    
    //Funzione per controllare se hai finito la partita
    func finisciPartita()->Bool{
        let alert = UIAlertController(title: "HAI VINTO", message: nil, preferredStyle: .actionSheet)
        
        let azione = UIAlertAction(title: "NUOVA PARTITA", style: .default, handler: self.nuovaPartita(_:))
        
        alert.addAction(azione)
        
        if  array == numeriOrdinati{
            self.present(alert, animated: true)
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
            bottoni[i].isUserInteractionEnabled = true
        }
    }
    
    @IBAction func stepperDifficolta(){
        var diff = ""
        stp_difficolta.minimumValue = 1
        stp_difficolta.maximumValue = 3
        switch stp_difficolta.value {
        case 1:
            diff = "Difficoltà: Facile"
            difficolta = Int(stp_difficolta.value * 10)
        case 2:
            diff = "DIfficoltà: Media"
            difficolta = Int(stp_difficolta.value * 10)
        case 3:
            diff = "Difficoltà: Difficile"
            difficolta = Int(stp_difficolta.value * 10)
        default:
            diff = "Difficoltà: Facile"
        }
        lbl_difficolta.text = diff
        
    }
    
    
    
    @IBAction func spostaNumero(_ sender: UIButton) {
        let posZero = array.firstIndex(of: 0)
        let pos = bottoni.firstIndex(of: sender)
        var eFinita : Bool
        switch pos {
        case 3,7,11:
            switch pos {
            case posZero!+4,posZero!-4,posZero!+1:
                array.swapAt(posZero!, pos!)
                eFinita = finisciPartita()
            default:
                eFinita = finisciPartita()
            }
        case 4,8,12:
            switch pos {
            case posZero!+4,posZero!-4,posZero!-1:
                array.swapAt(posZero!, pos!)
                eFinita = finisciPartita()
            default:
                eFinita = finisciPartita()
            }
            
        default:
            switch pos {
            case posZero!+1,posZero!-1,posZero!+4,posZero!-4:
                array.swapAt(posZero!, pos!)
                eFinita = finisciPartita()
            default:
                eFinita = finisciPartita()
            }
        }
        
        if eFinita == true{
            blocca()
        }
        inserisciMatriceGraficamente()
    }
    
    func nuovaPartita(_ sender: Any) {
        stepperDifficolta()
        array = mischiaNumeri(difficolta: difficolta)
        inserisciMatriceGraficamente()
        sblocca()
    }
    
    
}

