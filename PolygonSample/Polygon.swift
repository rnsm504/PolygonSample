//
//  Polygon.swift
//  PolygonSample
//
//  Created by Masanori Kuze on 2016/11/30.
//  Copyright © 2016年 Masanori Kuze. All rights reserved.
//

import UIKit


enum Polygon : Int {
    case pentagon = 5   // ５角形
    case hexagon = 6    // 6角形
    case octagonal = 8  // 8角形
    case decagon = 10   // 10角形
    case dodecagon = 12 // 12角形
    case hexadecagon = 16 // 16角形
    case heptadecagon = 17 // 17角形
    case star = 0
}


func polygonPath(rect : CGRect, polygon : Polygon) -> UIBezierPath {
    
    func pentagon() -> UIBezierPath {
        let radius : CGFloat = rect.width > rect.height ? rect.height/2 : rect.width/2
        let centerPoint : CGPoint = CGPoint(x:rect.midX, y:rect.midY)
        let centerCirlce : Circle = Circle(centerPoint: centerPoint, radius: radius)
        
        let line = Line(p1: centerPoint, p2: CGPoint(x: centerPoint.x + 50, y: centerPoint.y))
        let cdPoints = getCrossPoint(c1: centerCirlce, l1: line)
        let cp = cdPoints[0]
        
        let leftCircle = Circle(centerPoint: cp, radius: radius)
        let efPoints = getCrossPoint(c1: centerCirlce, c2: leftCircle)
        let gp = CGPoint(x: efPoints[0].x, y: centerPoint.y)
        let ap = CGPoint(x: centerPoint.x, y: centerPoint.y - radius)
        let bp = CGPoint(x: centerPoint.x, y: centerPoint.y + radius)
        
        let agLine = getLineLength(gp, point2: ap)
        let lefrCircle2 = Circle(centerPoint: gp, radius: agLine)
        let hpPoints = getCrossPoint(c1: lefrCircle2, l1: Line(p1: centerPoint, p2: CGPoint(x: centerPoint.x + 20, y: centerPoint.y)))
        let hp = hpPoints[1]
        let ahLine = getLineLength(ap, point2: hp)
        
        let ahCircle = Circle(centerPoint: ap, radius: ahLine)
        let ijPoints = getCrossPoint(c1: centerCirlce, c2: ahCircle)
        let (ip, jp) = (ijPoints[0], ijPoints[1])
        
        let ohLine = getLineLength(centerPoint, point2: hp)
        let bottomCircle = Circle(centerPoint: bp, radius: ohLine)
        
        let klPoints = getCrossPoint(c1: centerCirlce, c2: bottomCircle)
        let (kp, lp) = (klPoints[0], klPoints[1])
        
        
        let path = UIBezierPath()
        path.move(to: ap)
        path.addLine(to: jp)
        path.addLine(to: kp)
        path.addLine(to: lp)
        path.addLine(to: ip)
        path.close()
        
        return path
    }
    
    
    func star() -> UIBezierPath {
        let radius : CGFloat = rect.width > rect.height ? rect.height/2 : rect.width/2
        let centerPoint : CGPoint = CGPoint(x:rect.midX, y:rect.midY)
        let centerCirlce : Circle = Circle(centerPoint: centerPoint, radius: radius)
        
        let line = Line(p1: centerPoint, p2: CGPoint(x: centerPoint.x + 50, y: centerPoint.y))
        let cdPoints = getCrossPoint(c1: centerCirlce, l1: line)
        let cp = cdPoints[0]
        
        let leftCircle = Circle(centerPoint: cp, radius: radius)
        let efPoints = getCrossPoint(c1: centerCirlce, c2: leftCircle)
        let gp = CGPoint(x: efPoints[0].x, y: centerPoint.y)
        let ap = CGPoint(x: centerPoint.x, y: centerPoint.y - radius)
        let bp = CGPoint(x: centerPoint.x, y: centerPoint.y + radius)
        
        let agLine = getLineLength(gp, point2: ap)
        let lefrCircle2 = Circle(centerPoint: gp, radius: agLine)
        let hpPoints = getCrossPoint(c1: lefrCircle2, l1: Line(p1: centerPoint, p2: CGPoint(x: centerPoint.x + 20, y: centerPoint.y)))
        let hp = hpPoints[1]
        let ahLine = getLineLength(ap, point2: hp)
        
        let ahCircle = Circle(centerPoint: ap, radius: ahLine)
        let ijPoints = getCrossPoint(c1: centerCirlce, c2: ahCircle)
        let (ip, jp) = (ijPoints[0], ijPoints[1])
        
        let ohLine = getLineLength(centerPoint, point2: hp)
        let bottomCircle = Circle(centerPoint: bp, radius: ohLine)
        
        let klPoints = getCrossPoint(c1: centerCirlce, c2: bottomCircle)
        let (kp, lp) = (klPoints[0], klPoints[1])
        
        
        let path = UIBezierPath()
        path.move(to: ap)
        path.addLine(to: kp)
        path.addLine(to: ip)
        path.addLine(to: jp)
        path.addLine(to: lp)
        path.close()
        
        return path
    }
    
    func hexagon() -> UIBezierPath {
        let radius : CGFloat = rect.width > rect.height ? rect.height/2 : rect.width/2
        let centerPoint : CGPoint = CGPoint(x:rect.midX, y:rect.midY)
        let centerCirlce : Circle = Circle(centerPoint: centerPoint, radius: radius)
        
        let upPoint = CGPoint(x: rect.midX, y: rect.midY - radius)
        let upCircle = Circle(centerPoint: upPoint, radius: radius)
        let upCrossPoint = getCrossPoint(c1: centerCirlce, c2: upCircle)
        let downPoint = CGPoint(x: rect.midX, y: rect.midY + radius)
        let downCircle = Circle(centerPoint: downPoint, radius: radius)
        let downCrossPoint = getCrossPoint(c1: centerCirlce, c2: downCircle)
        
        var hexagonPoints = [CGPoint]()
        hexagonPoints.append(CGPoint(x: rect.midX, y: rect.midY - radius))
        hexagonPoints.append(upCrossPoint[0])
        hexagonPoints.append(downCrossPoint[1])
        hexagonPoints.append(CGPoint(x: rect.midX, y: rect.midY + radius))
        hexagonPoints.append(downCrossPoint[0])
        hexagonPoints.append(upCrossPoint[1])
        
        let path = UIBezierPath()
        path.move(to: hexagonPoints[0])
        path.addLine(to: hexagonPoints[1])
        path.addLine(to: hexagonPoints[2])
        path.addLine(to: hexagonPoints[3])
        path.addLine(to: hexagonPoints[4])
        path.addLine(to: hexagonPoints[5])
        path.close()
        
        return path
    }
    
    
    func octagonal() -> UIBezierPath {
        let radius : CGFloat = rect.width > rect.height ? rect.height/2 : rect.width/2
        let centerPoint : CGPoint = CGPoint(x:rect.midX, y:rect.midY)
        let centerCirlce : Circle = Circle(centerPoint: centerPoint, radius: radius)
        
        let line = Line(p1: centerPoint, p2: CGPoint(x: centerPoint.x + 50, y: centerPoint.y))
        
        let xline = getCrossPoint(c1: centerCirlce, l1: line)
        let (a1, b1) = (xline[0], xline[1])
        let leftCircle = Circle(centerPoint: b1, radius: getLineLength(a1, point2: b1))
        let RightCircle = Circle(centerPoint: a1, radius: getLineLength(a1, point2: b1))
        let ary1 = getCrossPoint(c1: leftCircle, c2: RightCircle)
        let (c1, d1) = (ary1[0], ary1[1])
        let line2 = Line(p1: c1, p2: d1)
        let yline = getCrossPoint(c1: centerCirlce, l1: line2)
        let (e1, f1) = (yline[0], yline[1])
        let giCircle = Circle(centerPoint: a1, radius: centerCirlce.radius)
        let ghCircle = Circle(centerPoint: f1, radius: centerCirlce.radius)
        let hjCircle = Circle(centerPoint: b1, radius: centerCirlce.radius)
        let jiCircle = Circle(centerPoint: e1, radius: centerCirlce.radius)
        
        let g1 = getCrossPoint(c1: giCircle, c2: ghCircle)[1]
        let h1 = getCrossPoint(c1: ghCircle, c2: hjCircle)[1]
        let j1 = getCrossPoint(c1: hjCircle, c2: jiCircle)[1]
        let i1 = getCrossPoint(c1: jiCircle, c2: giCircle)[1]
        
        
        let line3 = Line(p1: g1, p2: j1)
        let line4 = Line(p1: h1, p2: i1)
        
        let knPoints = getCrossPoint(c1: centerCirlce, l1: line3)
        let lmPoints = getCrossPoint(c1: centerCirlce, l1: line4)
        
        let octagonalPoints = [f1, knPoints[0], a1, lmPoints[0], e1, knPoints[1], b1, lmPoints[1]]
        
        let path = UIBezierPath()
        path.move(to: f1)
        octagonalPoints.forEach { (point) in
            path.addLine(to: point)
        }
        path.close()
        return path
    }
    
    func decagon() -> UIBezierPath {
        let radius : CGFloat = rect.width > rect.height ? rect.height/2 : rect.width/2
        let centerPoint : CGPoint = CGPoint(x:rect.midX, y:rect.midY)
        let centerCirlce : Circle = Circle(centerPoint: centerPoint, radius: radius)
    
        let line = Line(p1: centerPoint, p2: CGPoint(x: centerPoint.x + 50, y: centerPoint.y))
        
        let cdpoints = getCrossPoint(c1: centerCirlce, l1:line)
        let cp = cdpoints[0]
        
        let leftCircle = Circle(centerPoint: cp, radius: radius)
        
        let efPoints = getCrossPoint(c1: centerCirlce, c2: leftCircle)
        let gp = CGPoint(x: efPoints[0].x, y: centerPoint.y)
        let ap = CGPoint(x: centerPoint.x, y: centerPoint.y - radius)
        let bp = CGPoint(x: centerPoint.x, y: centerPoint.y + radius)
        
        let agLine = getLineLength(gp, point2: ap)
        let lefrCircle2 = Circle(centerPoint: gp, radius: agLine)
        let hpPoints = getCrossPoint(c1: lefrCircle2, l1: Line(p1: centerPoint, p2: CGPoint(x: centerPoint.x + 20, y: centerPoint.y)))
        let hp = hpPoints[1]
        let ahLine = getLineLength(ap, point2: hp)
        
        let ahCircle = Circle(centerPoint: ap, radius: ahLine)
        
        let ijPoints = getCrossPoint(c1: centerCirlce, c2: ahCircle)
        let (ip, jp) = (ijPoints[0], ijPoints[1])
        
        let ohLine = getLineLength(centerPoint, point2: hp)
        let bottomCircle = Circle(centerPoint: bp, radius: ohLine)
        
        let klPoints = getCrossPoint(c1: centerCirlce, c2: bottomCircle)
        let (kp, lp) = (klPoints[0], klPoints[1])
        
        let bhLines = getLineLength(bp, point2: hp)
        let bhCircle = Circle(centerPoint: bp, radius: bhLines)
        let mnPoints = getCrossPoint(c1: centerCirlce, c2: bhCircle)
        let (mp, np) = (mnPoints[0], mnPoints[1])
        let pqCircle = Circle(centerPoint: ap, radius: ohLine)
        
        let pqPoints = getCrossPoint(c1: centerCirlce, c2: pqCircle)
        let (pp, qp) = (pqPoints[0], pqPoints[1])
        
        
        let path = UIBezierPath()
        path.move(to: ap)
        // 中心円と円との接点
        path.addLine(to: qp)
        path.addLine(to: jp)
        path.addLine(to: mp)
        path.addLine(to: kp)
        path.addLine(to: bp)
        path.addLine(to: lp)
        path.addLine(to: np)
        path.addLine(to: ip)
        path.addLine(to: pp)
        path.close()
        return path
    }
    
    
    func dodecagon() -> UIBezierPath {
        let radius : CGFloat = rect.width > rect.height ? rect.height/2 : rect.width/2
        let centerPoint : CGPoint = CGPoint(x:rect.midX, y:rect.midY)
        let centerCirlce : Circle = Circle(centerPoint: centerPoint, radius: radius)
        
        let line = Line(p1: centerPoint, p2: CGPoint(x: centerPoint.x + 50, y: centerPoint.y))
        
        let cdpoints = getCrossPoint(c1: centerCirlce, l1:line)
        let (cp, dp) = (cdpoints[0], cdpoints[1])
        
        let ap = CGPoint(x: centerPoint.x, y: centerPoint.y - radius)
        let bp = CGPoint(x: centerPoint.x, y: centerPoint.y + radius)
        
        let t1 = getCrossPoint(c1: centerCirlce, c2: Circle(centerPoint: ap, radius: radius))
        let t2 = getCrossPoint(c1: centerCirlce, c2: Circle(centerPoint: cp, radius: radius))
        let t3 = getCrossPoint(c1: centerCirlce, c2: Circle(centerPoint: bp, radius: radius))
        let t4 = getCrossPoint(c1: centerCirlce, c2: Circle(centerPoint: dp, radius: radius))
       
        let path = UIBezierPath()
        path.move(to: ap)
        path.addLine(to: t2[0])
        path.addLine(to: t1[1])
        path.addLine(to: cp)
        path.addLine(to: t3[0])
        path.addLine(to: t2[1])
        path.addLine(to: bp)
        path.addLine(to: t4[0])
        path.addLine(to: t3[1])
        path.addLine(to: dp)
        path.addLine(to: t1[0])
        path.addLine(to: t4[1])
        path.close()
        return path
    }
    
    
    func hexadecagon() -> UIBezierPath {
        let radius : CGFloat = rect.width > rect.height ? rect.height/2 : rect.width/2
        let centerPoint : CGPoint = CGPoint(x:rect.midX, y:rect.midY)
        let centerCirlce : Circle = Circle(centerPoint: centerPoint, radius: radius)

        //円Oを通る直線AB
        let abLine = Line(p1: centerPoint, p2: CGPoint(x: centerPoint.x + 50, y: centerPoint.y))
        //円Oを通る直線CD
        let cdLine = Line(p1: centerPoint, p2: CGPoint(x: centerPoint.x, y:centerPoint.y+50))
        
        //交点AB
        let abPoints = getCrossPoint(c1: centerCirlce, l1: abLine)
        //交点EF
        let efPoints = getCrossPoint(c1: centerCirlce, l1: cdLine)
        
        //円AO
        let aoCircle = Circle(centerPoint: abPoints[0], radius: radius)
        
        //円BO
        let boCircle = Circle(centerPoint: abPoints[1], radius: radius)
        
        //円EO
        let eoCircle = Circle(centerPoint: efPoints[1], radius: radius)
        
        //円FO
        let foCircle = Circle(centerPoint: efPoints[0], radius: radius)
        
        //点G
        let gPoint = getCrossPoint(c1: aoCircle, c2: eoCircle)[1]
        
        //点H
        let hPoint = getCrossPoint(c1: eoCircle, c2: boCircle)[0]
        
        //点I
        let iPoint = getCrossPoint(c1: foCircle, c2: boCircle)[0]
        
        //点J
        let jPoint = getCrossPoint(c1: aoCircle, c2: foCircle)[0]
        
        //線gi
        let giLine = Line(p1: gPoint, p2: iPoint)
        
        //円と線giの交点
        let giPoints = getCrossPoint(c1: centerCirlce, l1: giLine)
        
        //線hj
        let hjLine = Line(p1: hPoint, p2: jPoint)
        
        //円と線hjの交点
        let hjPoints = getCrossPoint(c1: centerCirlce, l1: hjLine)
        
        //線AE
        let aeLine = Line(p1:abPoints[0] , p2: efPoints[1])
        
        //線EB
        let ebLine = Line(p1: efPoints[1], p2: abPoints[1])
        
        //線BF
        let bfLine = Line(p1: abPoints[1], p2: efPoints[0])
        
        //線FA
        let faLine = Line(p1: efPoints[0], p2: abPoints[0])
        
        //交点K
        let kPoint = getCrossPoint(c1: eoCircle, l1: aeLine)[0]
        
        //交点L
        let lPoint = getCrossPoint(c1: aoCircle, l1: aeLine)[1]
        
        //交点M
        let mPoint = getCrossPoint(c1: boCircle, l1: ebLine)[0]
        
        //交点N
        let nPoint = getCrossPoint(c1: eoCircle, l1: ebLine)[1]
        
        //交点P
        let pPoint = getCrossPoint(c1: foCircle, l1: bfLine)[1]
        
        //交点Q
        let qPoint = getCrossPoint(c1: boCircle, l1: bfLine)[0]
        
        //交点R
        let rPoint = getCrossPoint(c1: aoCircle, l1: faLine)[1]
        
        //交点S
        let sPoint = getCrossPoint(c1: foCircle, l1: faLine)[0]
        
        //線lq
        let lqLine = Line(p1: lPoint, p2: qPoint)
        
        //円と線lqの交点
        let lqPoints = getCrossPoint(c1: centerCirlce, l1: lqLine)
        
        //線mr
        let mrLine = Line(p1: mPoint, p2: rPoint)
        
        //円と線mrの交点
        let mrPoints = getCrossPoint(c1: centerCirlce, l1: mrLine)
        
        //線ns
        let nsLine = Line(p1: nPoint, p2: sPoint)
        
        //円と線nsの交点
        let nsPoints = getCrossPoint(c1: centerCirlce, l1: nsLine)
        
        //線pk
        let pkLine = Line(p1: pPoint, p2: kPoint)
        
        //円と線pkの交点
        let pkPoints = getCrossPoint(c1: centerCirlce, l1: pkLine)
        
        let path = UIBezierPath()
        path.move(to: efPoints[1])
        path.addLine(to: lqPoints[0])
        path.addLine(to: giPoints[0])
        path.addLine(to: pkPoints[0])
        path.addLine(to: abPoints[0])
        path.addLine(to: nsPoints[0])
        path.addLine(to: hjPoints[0])
        path.addLine(to: mrPoints[0])
        path.addLine(to: efPoints[0])
        path.addLine(to: lqPoints[1])
        path.addLine(to: giPoints[1])
        path.addLine(to: pkPoints[1])
        path.addLine(to: abPoints[1])
        path.addLine(to: nsPoints[1])
        path.addLine(to: hjPoints[1])
        path.addLine(to: mrPoints[1])
        path.close()
     
        return path
    }
    
    func heptadecagon() -> UIBezierPath {
        let radius : CGFloat = rect.width > rect.height ? rect.height/2 : rect.width/2
        let centerPoint : CGPoint = CGPoint(x:rect.midX, y:rect.midY)
        let centerCirlce : Circle = Circle(centerPoint: centerPoint, radius: radius)
        
        //円Oを通る直線AB
        let abLine = Line(p1: centerPoint, p2: CGPoint(x: centerPoint.x + 50, y: centerPoint.y))
        
        //ABの垂直２等分線のポイント
        let ab2p = CGPoint(x: centerPoint.x, y: centerPoint.y + radius)
        //円Oとの交点
        let cdpoints = getCrossPoint(c1: centerCirlce, l1:abLine)
        let (bp, ap) = (cdpoints[0], cdpoints[1])
        let cp = CGPoint(x: centerPoint.x, y: centerPoint.y - radius)
        //OCの中点D
        let dp = CGPoint(x: centerPoint.x, y: centerPoint.y - radius/2)
        //ODの中点E
        let ep = CGPoint(x: dp.x, y: dp.y + (centerPoint.y - dp.y)/2)
        
        //弧EA用の円
        let eaLine = getLineLength(ep, point2: ap)
        let eafCircle = Circle(centerPoint: ep, radius: eaLine)
        
        //ABの垂直２等分線
        let ab2Line = Line(p1: centerPoint, p2: ab2p)
        let eafPoints = getCrossPoint(c1: eafCircle, l1: ab2Line)
        
        //弧EAとABの垂直２等分線の交点(中点より下）
        let fp = eafPoints[0]
        
        //角AEFの２等分線と円Oの交点G
        let tmp = Line(p1: fp, p2: ap)
        let tmpx = (ap.x + eafPoints[0].x)/2
        let tmpy = (-tmp.a * tmpx) - tmp.c
        let tmpLine = Line(p1: ep, p2: CGPoint(x: tmpx, y: tmpy))
        let gPoints = getCrossPoint(c1: eafCircle, l1: tmpLine)
        
        
        //角度GEFの２等分線と弧AEFとの交点Hと線ABとの交点I
        let hx = (fp.x + gPoints[1].x)/2
        let hl = Line(p1: fp, p2: gPoints[1])
        let hy = (-hl.a * hx) - hl.c
        let hl2 = Line(p1: ep, p2: CGPoint(x: hx, y: hy))
        let hPoints = getCrossPoint(c1: eafCircle, l1: hl2)
        
        let iPoints = getCrossPoint(l1: hl2, l2: abLine)
        
        //半径OA=OB、中心Eの弧J
        let jCircle = Circle(centerPoint: ep, radius: radius)
        let jPoints = getCrossPoint(c1: jCircle, l1: hl2)
        
        //半径OA=OB、中心Jの弧J2
        let jCircle2 = Circle(centerPoint: jPoints[1], radius: radius)
        
        //半径BC=AC、中心Eの弧K
        let bc = radius * sqrt(2.0)
        let kCircle = Circle(centerPoint: ep, radius: bc)
        
        let kPoints = getCrossPoint(c1: kCircle, c2: jCircle2)
        
        //直線EK（点L)
        let kl = Line(p1: kPoints[0], p2: ep)
        let lPoint = getCrossPoint(l1: kl, l2: abLine)
        
        //ALの中点M
        let mPoint = CGPoint(x:((lPoint?[0].x)! + ap.x)/2, y: ap.y)
        
        let alHalf = ap.x - mPoint.x
        
        let almCircle = Circle(centerPoint: mPoint, radius: alHalf)
        let npLine = Line(p1: centerPoint, p2: cp)
        
        //円M-AL（点N,P)
        let npPoints = getCrossPoint(c1: almCircle, l1: npLine)
        
        let ni = getLineLength(iPoints![0], point2: npPoints[0])
        let inpCircle = Circle(centerPoint: iPoints![0], radius: ni)
        
        //円I-NP(点Q,R)
        let qrPoints = getCrossPoint(c1: inpCircle, l1: abLine)
        
        let suPoints = getCrossPoint(c1: centerCirlce, l1: Line(p1: qrPoints[0], p2: qrPoints[0]))
        let tvPoints = getCrossPoint(c1: centerCirlce, l1: Line(p1: qrPoints[1], p2: qrPoints[1]))
    
        let st2 = CGPoint(x:(tvPoints[1].x + suPoints[1].x)/2,
                          y:(tvPoints[1].y + suPoints[1].y)/2)
        
        let wl = Line(p1: suPoints[1], p2: tvPoints[1])
        //垂直２等分線
        let crossWl = Line(line: wl, p1: st2)
        
        let wp = getCrossPoint(c1: centerCirlce, l1: crossWl)
        
        //17角形の１辺の長さ
        let edge = getLineLength(wp[1], point2: suPoints[1])
        
        var tPoints = [CGPoint]()
        var tPoint = wp[1]
        
        for _ in 0...15 {
            // １７角形のポイントを測る円
            let circle = Circle(centerPoint: tPoint, radius: edge)
            // 中心円と円との接点
            tPoint = getCrossPoint(c1: centerCirlce, c2: circle)[1]
            tPoints.append(tPoint)
        }
        
        let path = UIBezierPath()
        
        path.move(to: wp[1])
        for tps in tPoints {
            path.addLine(to: CGPoint(x: tps.x, y: tps.y))
        }
        path.close()
        
        return path
    }
    
    switch polygon {
    case .pentagon:
        return pentagon()
    case .star:
        return star()
    case .hexagon:
        return hexagon()
    case .octagonal:
        return octagonal()
    case .decagon:
        return decagon()
    case .dodecagon:
        return dodecagon()
    case .hexadecagon:
        return hexadecagon()
    case .heptadecagon:
        return heptadecagon()
    }
}





//距離算出（斜辺の算出）
func getLineLength(_ point1 : CGPoint, point2 : CGPoint) -> CGFloat {
    let  radius = CGFloat(sqrt(pow(Double(point2.x - point1.x), 2) + pow(Double(point2.y - point1.y),2)))
    
    return radius
}

//円定義
struct Circle {
    var centerPoint : CGPoint
    var radius : CGFloat
}

//ax+by+c=0を定義
struct Line {
    var a : CGFloat
    var b : CGFloat
    var c : CGFloat
    var x : CGFloat
    
    init(p1: CGPoint, p2: CGPoint) {
        let d = p1.x == p2.x ? 0 : (p2.y - p1.y) / (p2.x - p1.x)
        let e =  -d * p1.x + p1.y
        
        a = -d
        b = 1
        c = p1.x == p2.x ? 0 : -e
        x = 0
        
        if(abs(a) == 0 && abs(c) == 0){
            x = p1.x
        }
    }
    
    //垂直２等分線
    init(line: Line, p1: CGPoint) {
        
        let d = -1 * -1 * line.b/line.a
        let e = -d * p1.x + p1.y
        
        a = -d
        b = 1
        c = -e
        x = 0
    }
}


//交差点（円と円）
func getCrossPoint(c1: Circle, c2: Circle) -> [CGPoint] {
    
    let a = 2 * (c2.centerPoint.x - c1.centerPoint.x)
    let b = 2 * (c2.centerPoint.y - c1.centerPoint.y)
    let c = (c1.centerPoint.x - c2.centerPoint.x) * (c1.centerPoint.x + c2.centerPoint.x) + (c1.centerPoint.y-c2.centerPoint.y) *
        (c1.centerPoint.y + c2.centerPoint.y) - (c1.radius - c2.radius) * (c1.radius + c2.radius)
    let l = a*a + b*b
    let k = a*c1.centerPoint.x + b*c1.centerPoint.y + c
    let d = l*c1.radius*c1.radius - k * k
    
    if(d>0){
        let ds = sqrt(d)
        let apl = a/l
        let bpl = b/l
        let xc = c1.centerPoint.x - apl * k
        let yc = c1.centerPoint.y - bpl * k
        let xd = bpl * ds
        let yd = apl * ds
        return [CGPoint(x:xc-xd, y:yc+yd), CGPoint(x:xc+xd, y:yc-yd)]
    }else if(d==0){
        return [CGPoint(x:c1.centerPoint.x-a*k/l, y:c1.centerPoint.y-b*k/l)]
    }else {
        return []
    }
    //x:xc-xd,y:yc+yd
}

//交差点（円と線）
func getCrossPoint(c1: Circle, l1: Line) -> [CGPoint] {
    let l = l1.a * l1.a + l1.b * l1.b
    var k : CGFloat
    var d : CGFloat
    
    //y軸に並行の場合
    if(abs(l1.a) == 0 && abs(l1.c) == 0){
        k = 0
        if(c1.centerPoint.x + c1.radius < l1.x || c1.centerPoint.x - c1.radius > l1.x)  {
            d = -1
        } else if(c1.centerPoint.x + c1.radius == l1.x || c1.centerPoint.x - c1.radius == l1.x) {
            d = 0
        } else {
            var tp1, tp2 : CGPoint
            if(l1.x == c1.centerPoint.x){
                tp1 = CGPoint(x: c1.centerPoint.x, y: c1.centerPoint.y + c1.radius)
                tp2 = CGPoint(x: c1.centerPoint.x, y: c1.centerPoint.y - c1.radius)
            } else {
                let t = abs(l1.x - c1.centerPoint.x)
                let h = CGFloat(sqrt(abs(pow(Double(c1.radius),2) - pow(Double(t), 2))))
                tp1 = CGPoint(x: l1.x, y: c1.centerPoint.y + h)
                tp2 = CGPoint(x: l1.x, y: c1.centerPoint.y - h)
            }
            return [tp1, tp2]
        }
    } else {
        k = l1.a*c1.centerPoint.x + l1.b*c1.centerPoint.y + l1.c
        d = l*c1.radius*c1.radius - k * k
    }
    if(d>0) {
        let ds = sqrt(d)
        let apl = l1.a/l
        let bpl = l1.b/l
        let xc = c1.centerPoint.x - apl * k
        let yc = c1.centerPoint.y - bpl * k
        let xd = bpl * ds
        let yd = apl * ds
        
        //x:xc-xd,y:yc+yd
        return [CGPoint(x:xc-xd, y:yc+yd), CGPoint(x:xc+xd, y:yc-yd)]
    } else if(d==0){
        return [CGPoint(x: c1.centerPoint.x-l1.a*k/l, y: c1.centerPoint.y-l1.b*k/l)]
    } else {
        return []
    }
}

//線と線
func getCrossPoint(l1: Line, l2: Line) -> [CGPoint]! {
    
    if (l1.a == l2.a) {
        return nil
    }
    
    let x = (l2.c - l1.c) / (l1.a - l2.a)
    let y = -l1.a * x - l1.c
    
    return [CGPoint(x: x, y: y)]
}
