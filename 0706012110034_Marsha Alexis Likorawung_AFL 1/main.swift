//
//  main.swift
//  0706012110034_Marsha Alexis Likorawung_AFL 1
//
//  Created by Marsha Likorawung  on 28/02/23.
//

//NIM 0706012110034

//import
import Foundation

//initialisasi
struct Game{
    var player: Player
    var golem : Golem
    var troll : Troll
    var damage : Int
    
    init(_ player:Player, _ golem:Golem,_ troll:Troll,_ damage:Int ){
        self.player = player
        self.golem = golem
        self.troll = troll
        self.damage = damage
    }
}

var game = Game(Player(""), Golem("Golem Hitler", 100), Troll("Troll Chaplin", 100),0)

//play game
GamePlay()

//pengecekan input berupa huruf bukan int
func validateInput(_ input: String) -> Bool {
    let letters = CharacterSet.letters
    let range = input.rangeOfCharacter(from: letters)
    return range != nil
}

//untuk saat sudah kalah dan mau bermain lagi dan saat belum selesai bermain tapi quite game untuk main lagi func ini di buat baru
func newGame(){
    game = Game(Player(""), Golem("Golem Hitler", 100), Troll("Troll Chaplin", 100),0)
}

//untuk memulai game
func GamePlay(){
    //new game
    newGame()
    //opening screen
    print("Welcome to the world of magic! 🧙‍♂️🧌\n")
    print("You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests 🌲, mountains ⛰️, and dungeons 🏰, where you will face challenges, make allies, and fight enemies.")
    print("Press [return] to continue: ")
    //pilihan untuk mulai main
    var input = readLine()
    //error handling jika input bukan enter, akan terus looping hingga benar
    while(input != ""){
        print("Wrong Input")
        print("Press [return] to continue: ")
        input = readLine()
    }
    
    //Welcoming screen
    print("May I know your name, a young wizard?")
    //tulis nama
    var name = readLine()!
    
    //untuk cek input berupa string atau int, jika bukan akan terus looping
    while !validateInput(name){
        print("May I know your name, a young wizard?")
        name = readLine()!
    }
    
    //buat player, buat enemy (golem dan troll) pada array dalam player, jadi player mempunyai 2 enemy yaitu golem dan troll
    game.player = Player(name)
    game.player.enemy.append(game.golem)
    game.player.enemy.append(game.troll)
    print("Nice to meet you \(game.player.name)!\n")
    //lalu lanjut ke menu utama (Journey Screen)
    JourneyScreen()
}

//Journey Screen halaman utama
func JourneyScreen(){
    //lose (ada pengecekan enemy sudah mati semua atau belum)
    game.player.Afterlosing()
    //pilihan menu utama
    print("From here, you can....\n \n[C]heck your health and stats \n[H]eal your wounds with potion\n[E]lixir for mana\n \n...or choose where you want to go\n \n[F]orest of Troll\n[M]ountain of Golem\n[Q]uit game \n \nYour choice?")
    let choose = readLine()!
    switch choose.uppercased() {
    case "E":
        //untuk menambah mana dari elixer
        game.player.UseElixer()
        break
    case "C":
        //untuk melihat detail player
        playerStatsScreen()
        break
    case "H":
        //heal wound screen, untuk ke halaman pakai potions
        healWoundScreen()
        break
    case "F":
        //Forest Of troll, untuk ke halaman melawan troll
        forestTrollScreen()
        break
    case "M":
        //Mountain Golem Screen, untuk ke halaman melawan golem
        mountainGolemScreen()
        break
    case "Q":
        //Flee from battle screen, untuk jika mau keluar dari game
        fleeFromBattle()
    default:
        //error handling jika input selain case diatas
        print("Wrong Input, Input Again!!")
        JourneyScreen()
    }
}

//untuk keluar dari game dan memulai game baru
func fleeFromBattle(){
    //pilihan setelah memilih case "Q", untuk kembali memulai game baru
    print("You feel that if you don't escape soon, you won't be able to continue the fight.\nYou look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.\n \nYou're safe, for now.\nPress [return] to continue:")
    //pilihan enter
    var input = readLine()
    //jika bukan enter error handling looping terus hingga benar
    while(input != ""){
        print("Wrong Input")
        print("Press [return] to continue: ")
        input = readLine()
    }
    //setelah benar, akan memulai game baru
    GamePlay()
}

//untuk melihat status player
func playerStatsScreen(){
    //menampilkan player
    print("Player name: \(game.player.name)\n \nHP: \(game.player.hp)/100 \nMP: \(game.player.mana)/50 \n \nMagic: \n- Physical Attack. No mana required. Deal 5pt of damage.\n- Meteor. Use 15pt of MP. Deal 50pt of damage.\n- Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n \nItems:\n- Potion x20. Heal 20pt of your HP.\n- Elixir x5. Add 10pt of your MP.\n \nPress [return] to go back: ")
    //pilihan enter
    var input1 = readLine()
    //jika bukan enter akan error handling sampai benar
    while(input1 != ""){
        print("Wrong Input")
        print("Press [return] to go back: ")
        input1 = readLine()
    }
    //setalah benar akan ke halaman utama
    JourneyScreen()
}

//halaman mountain golem
func mountainGolemScreen(){
    //mencari enemy pada array yang dari subclass enemy Golem
    for golem1 in game.player.enemy {
        //jika ditemukan yang memiliki class Golem maka akan muncul tampilan ini
        if golem1 is Golem {
            print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it a massive, snarling Golem emerging from the shadows.\n👿 Name: \(golem1.enemyName)\n👿 Health: \(golem1.enemyHp) \n \nChoose your action: \n[1] Physical Attack. No mana required. Deal 5pt of damage.\n[2] Meteor. Use 15pt of MP. Deal 50pt of damage.\n[3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n \n[4] Use Potion to heal wound.\n[5] Scan enemy's vital.\n[6] Flee from battle.\n \nYour choice?")
            //checker input int atau bukan, error handling
            var chooseGolem : Int?
            chooseGolem = Int(readLine()!)
            //pilihan untuk halaman mountain golem
            switch chooseGolem {
            case 1:
                //untuk player attack physical damagenya sebanyak 5 poin ke enemy, lalu dari method physical attack me-return damagenya untuk dipakai saat enemy melawan dengan shield
                game.damage = game.player.PhysicalAttack(golem1)
                //untuk attack oleh enemy di random akan dapat yang mana
                switch(Int.random(in: 1..<3)){
                case 1:
                    //golem punch damagenya 20 point ke player
                    game.golem.GolemPunch(game.player)
                    break
                case 2:
                    //attack biasa damagenya 15 point
                    game.golem.EnemyAttack(game.player)
                    break
                default:
                    //selain 1 dan 2 dari random ke attack biasa
                    game.golem.EnemyAttack(game.player)
                    break
                }
                break
            case 2:
                //meteor damage: 50 poin ke enemy
                game.damage = game.player.Meteor(golem1)
                switch(Int.random(in: 1..<3)){
                case 1:
                    //golempunch
                    game.golem.GolemPunch(game.player)
                    break
                case 2:
                    //attack biasa
                    game.golem.EnemyAttack(game.player)
                    break
                default:
                    //attack biasa
                    game.golem.EnemyAttack(game.player)
                    break
                }
                break
            case 3:
                //shield, damage 0 dan enemy tidak bisa attack
                game.player.Shield(golem1)
                break
            case 4:
                //untuk menggunakan potion ke tampilan heal wound
                healWoundScreen()
                break
            case 5:
                //scan enemy detail golem
                game.player.enemyVitalScreen(golem1)
                break
            case 6:
                //flee from battle, keluar
                JourneyScreen()
                break
            default:
                //error handling
                print("Wrong Input, please reinput!!")
                //looping kembali keatas
                mountainGolemScreen()
                break
            }
        }
    }
}

//halaman menyembuhkan heal wound
func healWoundScreen(){
    print("Your HP is \(game.player.hp). \nYou have \(game.player.potion) Potions.\n \nAre you sure want to use 1 potion to heal wound? [Y/N]")
    let heal = readLine()!
    //looping kalau y terus
    while (heal.uppercased() == "Y"){
        //while potions belum 0
        if (game.player.potion == 0){
            //run out of potion
            print("You don't have any potion left. Be careful of your next jouney. \nPress [return] to go back:")
            var inputret = readLine()
            while(inputret != ""){
                print("Wrong Input")
                print("You don't have any potion left. Be careful of your next jouney. \nPress [return] to go back:")
                inputret = readLine()
            }
            JourneyScreen()
        }else{
            //kalau potions ada ke method pakai potion
            game.player.UsePotion()
        }
    }
    if (heal.uppercased()=="N"){
        print("Cancelled")
        JourneyScreen()
    }else{
        while(heal.uppercased() != "N" || heal.uppercased() != "Y"){
            print("Wrong Input, Input Again!!")
            healWoundScreen()
        }
    }
}

//Halaman forest troll
func forestTrollScreen(){
    for troll1 in game.player.enemy {
        if troll1 is Troll {
            print("As you enter the forest, you feel a sense of unease wash over you. Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.\n \n👿 Name: \(troll1.enemyName)\n\n 👿 Health: \(troll1.enemyHp) \n \n Choose your action:\n[1] Physical Attack. No mana required. Deal 5pt of damage.\n[2] Meteor. Use 15pt of MP. Deal 50pt of damage.\n[3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n \n[4] Use Potion to heal wound.\n[5] Scan enemy's vital.\n[6] Flee from battle.\n \nYour choice?")
            var chooseF : Int?
            chooseF = Int(readLine()!)
            switch chooseF {
            case 1:
                //Physical attack
                game.damage = game.player.PhysicalAttack(troll1)
                switch(Int.random(in: 1..<3)){
                case 1:
                    //troll shield, return damage attack sebelumnya
                    game.troll.TrollShield(game.damage)
                    break
                case 2:
                    //attack biasa
                    game.troll.EnemyAttack(game.player)
                    break
                default:
                    //attack biasa
                    game.troll.EnemyAttack(game.player)
                    break
                }
                break
            case 2:
                //meteor attack
                game.damage = game.player.Meteor(troll1)
                switch(Int.random(in: 1..<3)){
                case 1:
                    //troll shield, return damage attack sebelumnya
                    game.troll.TrollShield(game.damage)
                    break
                case 2:
                    //attack biasa
                    game.troll.EnemyAttack(game.player)
                    break
                default:
                    //attack biasa
                    game.troll.EnemyAttack(game.player)
                    break
                }
                break
            case 3:
                //shield attack player, jadi tidak di attack enemy untuk 1 turn ini
                game.player.Shield(troll1)
                break
            case 4:
                //menggunakan potion
                healWoundScreen()
                break
            case 5:
                //scan enemy vital
                game.player.enemyVitalScreen(troll1)
                break
            case 6:
                //flee from battle, keluar game
                JourneyScreen()
                break
            default:
                //error handling
                print("Wrong Input, please reinput!!")
                forestTrollScreen()
                break
            }
        }
    }
}
