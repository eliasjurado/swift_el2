//
//  TVCcelda.swift
//  EL2EliasJurado
//
//  Created by DAMII on 11/17/19.
//  Copyright © 2019 Elías Jurado. All rights reserved.
//

import UIKit

class TVCcelda: UITableViewCell {
    @IBOutlet weak var lbCodigo: UILabel!
    @IBOutlet weak var lbRuc: UILabel!
    @IBOutlet weak var lbRazon: UILabel!
    @IBOutlet weak var lbDireccion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func mostrar(pentidad : Proveedor_BE)
    {
        self.lbCodigo.text = String(pentidad.codigoproveedor)
        self.lbRuc.text = pentidad.ruc
        self.lbRazon.text = pentidad.razonsocial
        self.lbDireccion.text = pentidad.direccion
    }

}
