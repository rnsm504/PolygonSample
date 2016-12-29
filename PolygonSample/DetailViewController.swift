//
//  DetailViewController.swift
//  PolygonSample
//
//  Created by Masanori Kuze on 2016/11/29.
//  Copyright © 2016年 Masanori Kuze. All rights reserved.
//

import UIKit


class customLayer : CAShapeLayer {

    var polygon : Polygon!
    
    override init() {
        super.init()
    }
    
    override init(layer: Any) {
        if layer is customLayer {
        }
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(in ctx: CGContext) {
        
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.addPath(polygonPath(rect: self.bounds, polygon: polygon).cgPath)
        ctx.drawPath(using: .stroke)
        
    }
}


class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var subLayer : customLayer!
    
    var polygon : Polygon!

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description

                
                subLayer.polygon = polygon
                subLayer.setNeedsDisplay()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        subLayer = customLayer()
        subLayer.frame = self.view.frame
        self.view.layer.addSublayer(subLayer)
        
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSString? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

