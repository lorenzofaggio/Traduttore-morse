import SwiftUI

struct ContentView: View {
    @State private var testo = ""
    @State private var morseScritto = ""
    @State private var vuoto = " "
    
    
    let morse: [Character: String] = [
        "a": "•-", "b": "-•••", "c": "–•-•", "d": "-••", "e": "•", "f": "••-•", "g": "--•",
        "h": "••••", "i": "••", "j": "•---", "k": "-•-", "l": "•-••", "m": "--", "n": "-•",
        "o": "---", "p": "•--•", "q": "--•-", "r": "•-•", "s": "•••", "t": "-", "u": "••-",
        "v": "•••-", "w": "•--", "x": "-••-", "y": "-•--", "z": "--••", " ":""
    ]
    
    let italiano: [String: Character] = [
        ".-": "a", "-...": "b", "-.-.": "c", "-..": "d", ".": "e", "..-.": "f", "--.": "g",
        "....": "h", "..": "i", ".---": "j", "-.-":"k", ".-..": "l", "--": "m", "-.": "n",
        "---": "o", ".--.": "p", "--.-": "q", ".-.": "r", "...": "s", "-": "t", "..-": "u",
        "...-": "v", ".--": "w", "-..-": "x", "-.--": "y", "--..": "z", "//": " ", " ":" "
    ]
    
    
    var body: some View {
        VStack {
            
            Text("Traduttore Morse")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            TextField("Inserisci una frase", text: $testo)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                let inputNormalizzato = testo
                    .replacingOccurrences(of: "•", with: ".")
                    .replacingOccurrences(of: "•", with: ".")
                    .replacingOccurrences(of: "–", with: "--")
                    .replacingOccurrences(of: "—", with: "--")
                    .replacingOccurrences(of: "·", with: ".")
                    .replacingOccurrences(of: "…", with: "...")
                    .replacingOccurrences(of: "–", with: "-")
                    .replacingOccurrences(of: "--.-.", with: "-.-.")
                    .replacingOccurrences(of: "-.-", with: "-.-")
                    .replacingOccurrences(of: "bb", with: "b")
                    .replacingOccurrences(of: "cc", with: "c")
                    .replacingOccurrences(of: "dd", with: "d")
                    .replacingOccurrences(of: "ff", with: "f")
                    .replacingOccurrences(of: "gg", with: "g")
                    .replacingOccurrences(of: "ll", with: "l")
                    .replacingOccurrences(of: "mm", with: "m")
                    .replacingOccurrences(of: "nn", with: "n")
                    .replacingOccurrences(of: "pp", with: "p")
                    .replacingOccurrences(of: "qq", with: "q")
                    .replacingOccurrences(of: "rr", with: "r")
                    .replacingOccurrences(of: "ss", with: "s")
                    .replacingOccurrences(of: "tt", with: "t")
                    .replacingOccurrences(of: "vv", with: "v")
                    .replacingOccurrences(of: "zz", with: "z")
                
                
                let caratteriMorse = CharacterSet(charactersIn: ".-/")
                if inputNormalizzato.trimmingCharacters(in: .whitespacesAndNewlines).unicodeScalars.allSatisfy({ caratteriMorse.contains($0) }) {
                    morseScritto = traduciMorse(inputNormalizzato)
                } else {
                    morseScritto = traduci(inputNormalizzato)
                }
            }) {
                Text("Traduci")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            TextEditor(text: .constant(morseScritto))
                .font(.title)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .textSelection(.enabled)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(height: 100)
                .padding(.top, 20)
            
            
            Text("Creato da Lorenzo Faggio e Raffaele Starace")
                .font(.caption)
                .foregroundColor(.gray)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            
        }
        .padding()
    }
    
    
    func traduci(_ word: String) -> String {
        var tradotto = ""
        for char in word.lowercased() {
            if let morse = morse[char] {
                tradotto += morse + "/"
            }
        }
            return tradotto.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    
    func traduciMorse(_ codice: String) -> String {
        let simboli = codice.replacingOccurrences(of: "//", with: "/ /").components(separatedBy: "/")
        var tradotto = ""
        for simbolo in simboli {
            if let lettera = italiano[simbolo] {
                tradotto.append(lettera)
            } else {
                print("simbolo non riconosciuto: '\(simbolo)'")
            }
        }
        return tradotto
    }
        
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
    }

//fatto da Lorenzo Faggio e Raffaele Starace
//skibidi prova per vedere se i git funzionanno
