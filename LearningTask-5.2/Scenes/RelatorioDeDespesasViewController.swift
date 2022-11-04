//
//  RelatorioDeDespesasViewController.swift
//  LearningTask-5.2
//
//  Created by jeovane.barbosa on 04/11/22.
//

import UIKit

class RelatorioDeDespesasViewController: UIViewController {
    

    
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var tipoTextField: UITextField!
    @IBOutlet weak var valorTextField: UITextField!
    
    
    @IBOutlet weak var listaDeDespesasView: ListaDeDespesasView!
    @IBOutlet weak var valorTotalLabel: UILabel!
    
    @IBOutlet weak var registrarButton: UIButton!
    
    typealias MensagemDeErro = String
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    func exibirAlerta(para mensagemDeErro: MensagemDeErro?){
        let alert = UIAlertController(
            title: "Erro",
            message: mensagemDeErro ?? "Verifique os dados informados e tente novamente.",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        self.present(alert, animated: true)
    }
    
    @IBAction func botaoAdicionarDespesaPressionado(_ sender: UIButton) {
        switch Validator.formularioEhValido(tituloTextField, tipoTextField, valorTextField){
        case (false, let mensagem):
            exibirAlerta(para: mensagem)
        default:
            print("Sucesss")
//            adicionaDespesas()
        }
    
        
        print("Adicionar despesas pressionado")
    }
    
//    @IBAction func botaoRegistrarDespesasPressionado(_ sender: UIButton) {
//    print("Registrar despesas pressionado")
//    }
    
}
