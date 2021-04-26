//
//  ViewController.swift
//  CallApp
//
//  Created by Emilia Nedyalkova on 23.04.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var callButton: UIButton!
    @IBOutlet var buttonZero: UIButton!
    @IBOutlet var hashtagButton: UIButton!
    @IBOutlet var asteriskButton: UIButton!
    @IBOutlet var buttonNine: UIButton!
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    @IBOutlet var buttonFour: UIButton!
    @IBOutlet var buttonFive: UIButton!
    @IBOutlet var buttonSix: UIButton!
    @IBOutlet var buttonSeven: UIButton!
    @IBOutlet var buttonEight: UIButton!
    
    private var buttons: [ String: (attributed: Bool, mainText: String?, secondaryText: String?, target: UIButton)] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.buttons = [
            "call": (attributed: false, mainText: nil, secondaryText: nil, target: callButton),
            "0": (attributed: true, mainText: "0", secondaryText: "+", target: buttonZero),
            "#": (attributed: false, mainText: nil, secondaryText: nil, target: hashtagButton),
            "*": (attributed: false, mainText: nil, secondaryText: nil, target: asteriskButton),
            "1": (attributed: true, mainText: "1", secondaryText: " ", target: buttonOne),
            "2": (attributed: true, mainText: "2", secondaryText: "A B C", target: buttonTwo),
            "3": (attributed: true, mainText: "3", secondaryText: "D E F", target: buttonThree),
            "4": (attributed: true, mainText: "4", secondaryText: "G H I", target: buttonFour),
            "5": (attributed: true, mainText: "5", secondaryText: "J K L", target: buttonFive),
            "6": (attributed: true, mainText: "6", secondaryText: "M N O", target: buttonSix),
            "7": (attributed: true, mainText: "7", secondaryText: "P Q R S", target: buttonSeven),
            "8": (attributed: true, mainText: "8", secondaryText: "T U V", target: buttonEight),
            "9": (attributed: true, mainText: "9", secondaryText: "W X Y Z", target: buttonNine)
        ]
        
        callButton.imageView?.contentMode = .scaleAspectFit
        callButton.clipsToBounds = true
        callButton.layer.cornerRadius = callButton.bounds.size.width * 0.5

        
        
        // callButton.se
        // buttonZero.titleLabel?.numberOfLines = 0
        
        formatAttributedString("0")
        formatAttributedString("1")
        formatAttributedString("2", 12, -5)
        formatAttributedString("3", 12, -5)
        formatAttributedString("4", 12, -5)
        formatAttributedString("5", 12, -5)
        formatAttributedString("6", 12, -5)
        formatAttributedString("7", 12, -5)
        formatAttributedString("8", 12, -5)
        formatAttributedString("9", 12, -5)
        
        for key in buttons.keys {
            let button = buttons[key]!.target
            shapeButton(button)
        }
    }
    
    private func shapeButton(_ button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = callButton.bounds.size.width * 0.5
    }
    
    private func formatAttributedString(_ key: String, _ fontSecondary: CGFloat = 18, _ spacing: CGFloat = -10) {
        if !buttons[key]!.attributed {
            return
        }
        
        let buttonSettings = buttons[key]!
        let button = buttonSettings.target
        button.titleLabel?.textAlignment = .center
        // button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        // let buttonText = "\(button.main)\n\()"
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
        
        let fontMain = UIFont.systemFont(ofSize: 36)
        let attributesMain = [NSMutableAttributedString.Key.font: fontMain, .paragraphStyle: paragraph]
        let attributedTextMain = NSMutableAttributedString(string: "\(buttonSettings.mainText!)\n" , attributes: attributesMain)
        
        paragraph.paragraphSpacingBefore = spacing
        let fontSecondary = UIFont.systemFont(ofSize: fontSecondary, weight: .bold)
        let attributesSecondary = [NSMutableAttributedString.Key.font: fontSecondary, .paragraphStyle: paragraph]
        let attributedTextSecondary = NSMutableAttributedString(string: buttonSettings.secondaryText!, attributes: attributesSecondary)
        
        attributedTextMain.append(attributedTextSecondary)
        button.setAttributedTitle(attributedTextMain, for: [])
    }
    
    
    private func test(_ key: String) {
        if !buttons[key]!.attributed {
            return
        }
        
        let buttonSettings = buttons[key]!
        let button = buttonSettings.target
        
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        /*
        let rect = CGRect(x: 0, y: 0, width: button.layer.bounds.width,
                          height: button.layer.bounds.height)
        button.frame = rect */
        //button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        let buttonText: NSString = "0\n+"
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
       // para
        
          //getting the range to separate the button title strings
          let newlineRange: NSRange = buttonText.range(of: "\n")

          //getting both substrings
          var substring1 = ""
          var substring2 = ""

          if(newlineRange.location != NSNotFound) {
              substring1 = buttonText.substring(to: newlineRange.location)
              substring2 = buttonText.substring(from: newlineRange.location)
          }

          //assigning diffrent fonts to both substrings
        let font1: UIFont = UIFont.systemFont(ofSize: 39)// (name: "Arial", size: 44)!
        print(substring1, substring2)
          let attributes1 = [NSMutableAttributedString.Key.font: font1, .paragraphStyle: paragraph]
          let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)

        paragraph.paragraphSpacingBefore = -8
        let font2: UIFont = UIFont.systemFont(ofSize: 15, weight: .bold)// (ofSize: 15) // (name: "Arial", size: 18)!
          let attributes2 = [NSMutableAttributedString.Key.font: font2, .paragraphStyle: paragraph]
          let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)

          //appending both attributed strings
          attrString1.append(attrString2)
        
        print(attrString1)

          //assigning the resultant attributed strings to the button
        button.setAttributedTitle(attrString1, for: [])
    }


}
