import Foundation

/* Bridge Pattern

 //MARK: Definition
 
   Bridge Pattern separates the implementation and definitions. Abstraction is key here.
   Makes Loosely coupled, Easy to testable, Maintainable.

 
 Examples:
 1. Cross-Platform Data Access with Different APIs: If you are building a cross platform mobile application, If you want to get data from different data source for iOS and Android, Then you create a interface with fetchData method. Confirm Android and iOS data fetch class and implement own ways.
 
 2.Analytics Engine
 3.Customizable UI Rendering with Different Themes:
 4. Flexible Network Request Management with Different Protocols:
 
 
*/
protocol MediaPlayer {
    func play()
    func pause()
    func stop()
}

class LocalMediaPlayer: MediaPlayer {
    var filePath:String
    
    init(filePath: String) {
        self.filePath = filePath
    }
    
    func play() {
        print("Local Play method")
    }
    
    func pause() {
        print("Local Pause Method")
    }
    
    func stop() {
        print("Local Stop Method")
    }
}

class StreamMediaPlayer: MediaPlayer {
    var filePath: String
    
    init(filePath: String) {
        self.filePath = filePath
    }
    
    func play() {
        print("Stream Play method")
    }
    
    func pause() {
        print("Stream Pause Method")
    }
    
    func stop() {
        print("Stream Stop Method")
    }
}

class MusicPlayerController: MediaPlayer {
    let players: [MediaPlayer] // We use this kind of array if we handling the different Analytics engine
    
    init(players: [MediaPlayer]) {
        self.player = player
    }
    
    func play() {
        players.map{ $0.play()}
    }
    
    func pause() {
        players.map {$0.pause()}
    }
    
    func stop() {
        players.map {$0.pause()}
    }
}

let localPlayer = LocalMediaPlayer(filePath: "Local Path")
let streamPlayer = StreamMediaPlayer(filePath: "Live Path")
let musicPlayer = MusicPlayerController(player: [localPlayer, streamPlayer])

musicPlayer.play()



protocol Shape {
    func draw()
}

class Circle: Shape {
    func draw() {
       print("draw circle shape")
    }
}

class Triangle: Shape {
    func draw() {
        print("Triangle Pattern")
    }
}


class ColoredShape: Shape {
    let color: UIColor
    let shape: Shape
    
    init(color: UIColor, shape: Shape) {
        self.color = color
        self.shape = shape
    }
    
    func draw() {
        print("\(shape.draw()) with color: \(color)")
    }
}

let redCircle = ColoredShape(color: .red, shape: Circle())
let greenTriangle = ColoredShape(color: .green, shape: Triangle())
