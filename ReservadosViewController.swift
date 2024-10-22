//
//  ServicosViewController.swift
//  MecanicApp
//
//  Created by Elisio Simao on 1/1/01.
//  Copyright © 2001 Cleyton&Samir. All rights reserved.
//

import UIKit

class ReservadosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let dbHelper = DBHelperUser()

    let tableView = UITableView()
    var dados = [(nome: String, servico: String, pagamento: Double)]() // Exemplo de tupla com os dados
    let lbn = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        lbn.text = "Reservados"
        lbn.textColor = UIColor(hex: "#f18f02")
        lbn.textAlignment = .center
        lbn.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        // Configuração da TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        view.addSubview(lbn)
        
        // Exemplo de dados que você pode buscar do banco de dados
//        dados = [
//            (nome: "Lavagem", pagamento: 250.0, data: "05/10/2024"),
//            (nome: "Pintura", pagamento: 150.0, data: "06/10/2024"),
//            (nome: "Estampagem", pagamento: 300.0, data: "07/10/2024")
//        ]
        let servicos = dbHelper.fetchAllUsers()
        for servico in servicos {
            if(servico.StatusReserva == "reservado"){
                let nomeL = servico.email
                let precoL = servico.PrecoServicos
                let servicoL = servico.nomeServico
                dados.append((nome: nomeL, servico: servicoL, pagamento: precoL))
            }
           // print("ID: \(servico.0), Nome: \(servico.1), Preço: \(servico.2)")
        }
        lView()
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count
    }
    
    // Função que configura cada célula da tabela
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dado = dados[indexPath.row]
        cell.textLabel?.text = "\(dado.servico) -\(dado.pagamento) MZN"
        print(dado)
        return cell
    }
    
    // Função que trata o clique em uma célula
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let detalheVC = FeitoServicosViewController()
                detalheVC.dadoSelecionado = dados[indexPath.row] // Passar os dados para o próximo ViewController
                navigationController?.pushViewController(detalheVC, animated: true) // Navegar para a nova tela
    }
    
    // Configura as constraints da TableView
    func lView() {
        
        let largura = view.frame.size.width
        let altura = view.frame.size.height
        lbn.frame = CGRect(x: (largura - (largura-100))/2, y: 150, width: largura-100, height: 40)
        tableView.frame = CGRect(x: 20, y: 230, width: largura-20, height: altura-150)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
