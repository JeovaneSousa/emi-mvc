//
//  RelatorioDeDespesasViewController.swift
//  LearningTask-5.2
//
//  Created by jeovane.barbosa on 04/11/22.
//

import UIKit

class RelatorioDeDespesasViewController: UIViewController {
    

    typealias MensagemDeErro = String
    
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var tipoTextField: UITextField!
    @IBOutlet weak var valorTextField: UITextField!
    
    
    @IBOutlet weak var listaDeDespesasView: ListaDeDespesasView!
    @IBOutlet weak var valorTotalLabel: UILabel!
    
    @IBOutlet weak var registrarButton: UIButton!
    
    var relatorioDeDespesas: RelatorioDeDespesas?{
        didSet{
            guard isViewLoaded, let relatorioDeDespesas = relatorioDeDespesas else {return}
            atualizaViews(para: relatorioDeDespesas)
        }
    }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        if let relatorioDeDespesas = relatorioDeDespesas{
            atualizaViews(para: relatorioDeDespesas)
        }
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
            adicionaDespesa()
        }
    }
    
    @IBAction func botaoRegistrarDespesasPressionado(_ sender: UIButton) {
    print("Registrar despesas pressionado")
    }
    
    
    
    func adicionaDespesa(){
        let codigo = Int(tipoTextField.text!)!
        let tipo = Despesa.Tipo(rawValue: codigo)!
        let titulo = tituloTextField.text!
        let valor = Converter.paraDecimal(string: valorTextField.text!)!
        
        let despesa = Despesa(titulo: titulo, tipo: tipo, valor: valor)
        relatorioDeDespesas?.adiciona(despesa)
    }
    
    func atualizaViews(para relatorio: RelatorioDeDespesas) {
        listaDeDespesasView.atualiza(relatorio.despesas)
        
        valorTotalLabel.text = Formatter.paraMoeda(decimal: relatorio.valorTotal)
        registrarButton.isEnabled = relatorio.valorTotal > 0
    }
    
    
    

}
