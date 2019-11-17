//
//  VCregistrar.swift
//  EL2EliasJurado
//
//  Created by DAMII on 11/17/19.
//  Copyright © 2019 Elías Jurado. All rights reserved.
//

import UIKit

class VCregistrar: UIViewController {
    @IBOutlet weak var tfcodigo: UITextField!
    @IBOutlet weak var tfrazon: UITextField!
    @IBOutlet weak var tfdireccion: UITextField!
    @IBOutlet weak var tfruc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func grabar(_ sender: Any) {
       
        
        
        let urlGrabar = "http://wscibertec201922.somee.com/Proveedor/RegistraModifica?pTipoTransaccion=N&CodigoProve edor="+tfcodigo.text!+"&RazonSocial="+tfrazon.text!+"&Direccion="+tfdireccion.text!+"&Ruc="+tfruc.text!
        print(urlGrabar)
        let urlPush = URL(string: urlGrabar)
        let peticion = URLRequest(url: urlPush!)
        
        let tarea = URLSession.shared.dataTask(with: peticion)
        {Datos, Respuesta, Error in
            print("por iniciar")
            if(Error == nil)
            {
                print("por procesar datos")
                print(Datos ?? "Vacio")
                let datosCadena = NSString(data: Datos!,encoding: String.Encoding.utf8.rawValue)
                print(datosCadena!)
                print("fin procesar datos")
                
//                DispatchQueue.main.async {
//                    let JSON = try? JSONSerialization.jsonObject(with: Datos!, options: [])
//                    
//                    if let dictionary = JSON as? [String: Any], let wslista = dictionary["ObjListaPROVEEDOR"] as? [[String: Any]]
//                    {
//                        wslista.forEach{ Registro in
//                            let CodigoProveedor = Registro["CodigoProveedor"] as! Int
//                            let RazonSocial = Registro["RazonSocial"] as? String
//                            let Direccion = Registro["Direccion"] as? String
//                            let Ruc = Registro["Ruc"] as? String
//                            
//                            let proveedor1 = Proveedor_BE(prazonsocial: RazonSocial ?? "", pdireccion: Direccion ?? "", pruc: Ruc ?? "")
//                            proveedor1.codigoproveedor = CodigoProveedor
//                            self.oLista.append(proveedor1)
//                        }
//                        self.lbmsj.text = String(self.oLista.count) + " usuarios encontrados"
//                        self.tbLista.reloadData()
//                    }
//                }
            }
            else
            {
                print("Error")
                print(Error ?? "Error vacio")
            }
        }
        tarea.resume()
    }
    
}
