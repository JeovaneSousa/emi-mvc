//
//  Validator.swift
//  LearningTask-5.2
//
//  Created by jeovane.barbosa on 04/11/22.
//

import UIKit


class Validator{
   typealias MensagemDeErro = String
    
    static func formularioEhValido(_ tituloTextField: UITextField,_ tipoTextField: UITextField,_ valorTextField: UITextField) -> (Bool, MensagemDeErro?){
        if let titulo = tituloTextField.text, titulo.isEmpty{
            return (false, "Título inválido")
        }
        
        guard let tipoComoTexto = tipoTextField.text,
             let tipo = Int(tipoComoTexto),
             let _ = Despesa.Tipo(rawValue: tipo) else {
            return (false, "Tipo de despesa inválido")
            
        }
        
        guard let valorEmTexto = valorTextField.text,
             let _ = Converter.paraDecimal(string: valorEmTexto) else {
             return (false, "Valor inválido")
        }
        
        return (true, nil)
    }
}


