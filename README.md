多角形を描く関数を作ってみた



![Simulator Screen Shot 2017.01.01 22.38.22.png](https://qiita-image-store.s3.amazonaws.com/0/40693/0f02ce5f-0630-755c-73bc-308e41379717.png "Simulator Screen Shot 2017.01.01 22.38.22.png")
![Simulator Screen Shot 2017.01.01 22.39.32.png](https://qiita-image-store.s3.amazonaws.com/0/40693/5753ab28-73ca-ded2-f0bb-2cd650876c5f.png "Simulator Screen Shot 2017.01.01 22.39.32.png")
![Simulator Screen Shot 2017.01.01 22.39.41.png](https://qiita-image-store.s3.amazonaws.com/0/40693/ff9b62d0-0f4c-dd61-36c4-4e80ef18f480.png "Simulator Screen Shot 2017.01.01 22.39.41.png")
![Simulator Screen Shot 2017.01.01 22.39.52.png](https://qiita-image-store.s3.amazonaws.com/0/40693/ad780d58-8e46-b743-b4d8-8f9db6a8ed82.png "Simulator Screen Shot 2017.01.01 22.39.52.png")

３角形や４角形は用意されてるけど、５角形やそれ以上はどう描けばいいんだ？って思ったので調べてたらいつの間にか１７角形まで
調べてしまっていたので関数で使えるようにしたものを公開。



矩型範囲と描きたい多角形を引数で指定すればそのpathを返します。

```
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

	// 省略 
	
	return UIBezierPath
}


```

CALayer上で使う場合はこんな感じで使えます。

```
    override func draw(in ctx: CGContext) {
        
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.addPath(polygonPath(rect: self.bounds, polygon: polygon).cgPath)　// <- 呼び出し
        ctx.drawPath(using: .stroke)
        
    }

```

***参考

８角形以上の多角形の書き方ってネットでも資料が少なくて読みづらいのが多かったので、わざわざ本を買ってしまった・・・。

[コンパスと定規の数学: 手で考える幾何学の世界 (アルケミスト双書)](https://www.amazon.co.jp/gp/product/4422214861/ref=oh_aui_detailpage_o03_s00?ie=UTF8&psc=1)


