//
//  ViewController.swift
//  11AppFraseDairia
//
//  Created by djdenielb on 25/04/22.
//

import UIKit

class ViewController: UIViewController {
//    Instancia del objeto que se va a llenar con sus valores por default
    var model = Model(frase: "Sin frase", autor: "Sin autor")

//    Variables graficas
    @IBOutlet weak var labelFrase: UILabel!
    @IBOutlet weak var labelAutor: UILabel!
    @IBOutlet weak var botonRecargar: UIButton!
    
//    Funcion al arrancar
    override func viewDidLoad() {
        super.viewDidLoad()

//        Llamada a la funcion que decodifica la API
        model.ApiCreate(recibeString: "https://programming-quotes-api.herokuapp.com/quotes/random")
//        Asignacion de las variables graficas  a los elementos de la API
        labelFrase.text = model.autor
        labelAutor.text = model.frase
        
    }
    
//    Boton de recargar para que cuando se presione la API cambie de frase y de autor
    @IBAction func botonRecargar(_ sender: Any) {
        
//        Metodo para recargar la vista y al recarga volvemos a llamar a la funcion y llenamos los datos otra ves
        self.view.layoutIfNeeded()
        model.ApiCreate(recibeString: "https://programming-quotes-api.herokuapp.com/quotes/random")
        labelFrase.text = model.autor
        labelAutor.text = model.frase
    }
    

}

