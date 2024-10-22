//
//  ScreenHomeUserViewController.swift
//  MecanicApp
//
//  Created by Elisio Simao on 1/1/01.
//  Copyright © 2001 Cleyton&Samir. All rights reserved.
//

import UIKit

class ScreenHomeUserViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var nomeUser: String = "Joana"
    let dbHelper = DBHelperServicos()
    var status: String = "none"

    let tableView = UITableView()
    var dados = [(nome: String, preco: Double)]() // Exemplo de tupla com os dados
    let lbn = UILabel()

    let tituloBoasVindasField: UILabel = {
        let txt = UILabel()
        txt.text = "Bem vindo, "
        txt.textColor = UIColor(hex: "#222222")
        txt.numberOfLines = 0
        txt.lineBreakMode = .byWordWrapping
        txt.font = UIFont.boldSystemFont(ofSize: 20)
        return txt
    }()
    
    let bannerImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "bamm")
        return img
    }()
    
    let nomeDaPessoaField: UILabel = {
        let txt = UILabel()
        txt.text = "Clayton!"
        txt.textColor = UIColor(hex: "#f18f02")
        txt.numberOfLines = 0
        txt.lineBreakMode = .byWordWrapping
        txt.font = UIFont.boldSystemFont(ofSize: 15)
        return txt
    }()
    
    let sairButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sair", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(hex: "#f18f02")
        button.tintColor = UIColor(hex: "#ffffff")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        // Configuração da TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        lbn.text = "Nossos servicos"
        lbn.textColor = UIColor(hex: "#222222")
        lbn.textAlignment = .center
        lbn.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        // Exemplo de dados que você pode buscar do banco de dados
        let servicos = dbHelper.fetchAllServicos()
        for servico in servicos {
            let nomeL = servico.1
            let precoL = servico.2
            dados.append((nome: nomeL, preco: precoL))
            print("ID: \(servico.0), Nome: \(servico.1), Preço: \(servico.2)")
        }
        layout()
        sairButton.addTarget(self, action: #selector(sairTela), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    func layout(){
        
        let largura = view.frame.size.width
        let altura = view.frame.size.height
        
        view.addSubview(tituloBoasVindasField)
        view.addSubview(nomeDaPessoaField)
        view.addSubview(sairButton)
        view.addSubview(lbn)
        
        view.addSubview(bannerImg)

        print("Status: \(status)")
        bannerImg.frame = CGRect(x: 0, y: 200, width: largura, height: 170)

        
        tituloBoasVindasField.frame = CGRect(x: 20, y: 140, width: 120, height: 20)
        nomeDaPessoaField.frame = CGRect(x: 125, y: 140, width: 170, height: 20)
        sairButton.frame = CGRect(x: largura-60, y: 125, width: 40, height: 40)
        
        lbn.frame = CGRect(x: (largura - (largura-100))/2, y: 390, width: largura-100, height: 40)
        tableView.frame = CGRect(x: 20, y: 430, width: largura-20, height: altura)
        
        nomeDaPessoaField.text = "\(nomeUser)"

        
    }
    
    @objc func sairTela(){
        let t = ViewController()
        t.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(t, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count
    }
    
    // Função que configura cada célula da tabela
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dado = dados[indexPath.row]
        cell.textLabel?.text = "\(dado.nome) - \(dado.preco) MZN"
        print(dado)
        return cell
    }
    
    // Função que trata o clique em uma célula
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(status == "sem"){
            let detalheVC = ReservarViewController()
            detalheVC.emailUser = nomeUser
            detalheVC.dadoSelecionado = dados[indexPath.row] // Passar os dados para o próximo ViewController
            navigationController?.pushViewController(detalheVC, animated: true) // Navegar para a nova tela
        }
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
