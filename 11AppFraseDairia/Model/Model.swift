//
//  Model.swift
//  11AppFraseDairia
//
//  Created by djdenielb on 25/04/22.
//

import Foundation

//Este sera el manager
struct Model{
//    Variables que se llenaran con la decodificacion de la api
    var frase: String
    var autor: String
    
//    Funcion para crear la api
    mutating func ApiCreate(recibeString: String){
        let urlString = recibeString
        
        if let url = URL(string: urlString){
            if let datos = try? Data(contentsOf: url){
                decodicarJson(recibeData: datos)
            }
        }
    }
    
//    Decodifica API
    mutating func decodicarJson(recibeData: Data){
        let decoder = JSONDecoder()
        if let listaElementos = try? decoder.decode(Frase.self, from: recibeData){
//            LLena las variables con los elementos de la API
            frase = listaElementos.author ?? "Sin frase"
            autor = listaElementos.en ?? "Sin autor"
        }
    }
    
}
