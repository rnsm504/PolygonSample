//
//  Array.swift
//  PolygonSample
//
//  Created by msnr on 2016/12/30.
//  Copyright © 2016年 Masanori Kuze. All rights reserved.
//

import UIKit


struct List {
    var title : String
    var polygon : Polygon
}


var polygonArray : NSArray = [
    List(title: "pentagon 5", polygon: Polygon.pentagon),
    List(title: "star", polygon: Polygon.star),
    List(title: "hexagon 6", polygon: Polygon.hexagon),
    List(title: "octagonal 8", polygon: Polygon.octagonal),
    List(title: "decagon 10", polygon: Polygon.decagon),
    List(title: "dodecagon 12", polygon: Polygon.dodecagon),
    List(title: "heptadecagon 17", polygon: Polygon.heptadecagon)
]
