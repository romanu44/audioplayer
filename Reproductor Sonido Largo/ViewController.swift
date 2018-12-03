//
//  ViewController.swift
//  Reproductor Sonido Largo
//
//  Created by Rodrigo Márquez on 11/2/17.
//  Copyright © 2017 Rodrigo Márquez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progreso: UIProgressView!
    
    @IBOutlet weak var playbutton: UIButton!
    
    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var volumen: UISlider!
    
    private var reproductor: AVAudioPlayer!
    
    private var portada:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        portada = UIImage(named: "imagen.JPG")
        imagen.image = portada

        let sonidoURL = Bundle.main.url(forResource: "audio", withExtension: "mp3")
        
        do{
            try reproductor = AVAudioPlayer(contentsOf: sonidoURL!)
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAudioProgressView), userInfo: nil, repeats: true)
            progreso.setProgress(Float(reproductor.currentTime/reproductor.duration), animated: false)

        }catch{
            print("No se pudo abrir el archivo")
        }
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if portada == UIImage(named: "imagen.JPG"){
            portada = UIImage(named: "vivalavida.JPG")
            imagen.image = portada
            playbutton.isHidden = false
            do{
                try reproductor = AVAudioPlayer(contentsOf: cancion2!)
            }catch{
                print("No se pudo abrir el archivo")
            }
            reproductor.play()
        }
        if portada == UIImage(named: "vivalavida.JPG"){
            portada = UIImage(named: "leanart.jpg")
            imagen.image = portada
            playbutton.isHidden = false
            do{
                try reproductor = AVAudioPlayer(contentsOf: cancion3!)
            }catch{
                print("No se pudo abrir el archivo")
            }
            reproductor.play()
        }
        if portada == UIImage(named: "leanart.jpg"){
            portada = UIImage(named: "imagen.JPG")
            imagen.image = portada
            playbutton.isHidden = false
            do{
                try reproductor = AVAudioPlayer(contentsOf: sonidoURL!)
            }catch{
                print("No se pudo abrir el archivo")
            }
            reproductor.play()
        }
    }
    
    let sonidoURL = Bundle.main.url(forResource: "audio", withExtension: "mp3")
    let cancion2 = Bundle.main.url(forResource: "viva", withExtension: "mp3")
    let cancion3 = Bundle.main.url(forResource: "leanon", withExtension: "mp3")
    
    
    @IBAction func canc1() {
        portada = UIImage(named: "imagen.JPG")
        imagen.image = portada
        playbutton.isHidden = false
        do{
            try reproductor = AVAudioPlayer(contentsOf: sonidoURL!)
        }catch{
            print("No se pudo abrir el archivo")
        }
        reproductor.play()
    }
    
    @IBAction func canc2() {
        portada = UIImage(named: "vivalavida.JPG")
        imagen.image = portada
        playbutton.isHidden = false
        do{
            try reproductor = AVAudioPlayer(contentsOf: cancion2!)
        }catch{
            print("No se pudo abrir el archivo")
        }
        reproductor.play()
    }
    
    @IBAction func canc3() {
        portada = UIImage(named: "leanart.jpg")
        imagen.image = portada
        playbutton.isHidden = false
        do{
            try reproductor = AVAudioPlayer(contentsOf: cancion3!)
        }catch{
            print("No se pudo abrir el archivo")
        }
        reproductor.play()
    }
    
    
    @IBAction func play() {
        if !reproductor.isPlaying{
            reproductor.play()
            playbutton.isHidden=true
        }
    }
    
    @IBAction func pause() {
        if reproductor.isPlaying{
            reproductor.pause()
            playbutton.isHidden=false
        }
        else{
            if reproductor.currentTime == 0.0{
                reproductor.pause()
            }
            else{
            reproductor.play()
            }
        }
        
    }
    
    @IBAction func stop() {
        if reproductor.isPlaying{
            reproductor.stop()
            reproductor.currentTime=0.0
            playbutton.isHidden=false
        }
        if !reproductor.isPlaying{
            reproductor.stop()
            reproductor.currentTime=0.0
            playbutton.isHidden=false
        }
    }
    @objc func updateAudioProgressView()
    {
        if reproductor.isPlaying
        {
            progreso.setProgress(Float(reproductor.currentTime/reproductor.duration), animated: true)
        }
        else{
            progreso.setProgress(Float(reproductor.currentTime/reproductor.duration), animated: true)
        }
    }
    @IBAction func stopmusic() {
        if reproductor.isPlaying{
            reproductor.stop()
            reproductor.currentTime=0.0
            playbutton.isHidden=false
        }
    }
    
    @IBAction func cambiarvol() {
        reproductor.volume = volumen.value
        
//volumen.value, reproductor.volume(Float)[0.0-1.1], setVolume
    }
}

