//

import Foundation

class HomeViewModel: ObservableObject {
    //@Published var watchList: [String] = []
    
    @Published private(set) var popular = [
        Item(name: "Demon Slayer", classification: "A16", imageName: "kimetsu_3nd", description: "Demon Slayer: Kimetsu no Yaiba Entertainment District Arc follows Tanjiro and his friends' next mission after the Mugen Train. Alongside one of the Demon Slayer Corps' top ranked swordsmen, Sound Hashira Tengen Uzui, Tanjiro heads to a place where demons dwell – the Entertainment District.", genre: [.action, .fantasy, .shounen]),
        Item(name: "Attack on Titan", classification: "A16", imageName: "shingeki", description: "Known in Japan as Shingeki no Kyojin, many years ago, the last remnants of humanity were forced to retreat behind the towering walls of a fortified city to escape the massive, man-eating Titans that roamed the land outside their fortress. Only the heroic members of the Scouting Legion dared to stray beyond the safety of the walls – but even those brave warriors seldom returned alive. Those within the city clung to the illusion of a peaceful existence until the day that dream was shattered, and their slim chance at survival was reduced to one horrifying choice: kill – or be devoured!", genre: [.action, .adventure, .drama, .fantasy, .suspense]),
        Item(name: "Re:Zero", classification: "A16", imageName: "re:zero", description: "Natsuki Subaru, an ordinary high school student, is on his way home from the convenience store when he finds himself transported to another world. As he's lost and confused in a new world where he doesn't even know left from right, the only person to reach out to him was a beautiful girl with silver hair. Determined to repay her somehow for saving him from his own despair, Subaru agrees to help the girl find something she's looking for...", genre: [.action, .drama, .fantasy, .psychological, .suspense]),
        Item(name: "Death Note", classification: "A16", imageName: "deathnote", description: "Light Yagami is an ace student with great prospects and he's bored out of his mind. But all that changes when he finds the Death Note, a notebook dropped by a rogue Shinigami death god.", genre: [.action, .comedy, .fantasy])
    ]
    @Published private(set) var updates = [
        Item(name: "Jujutsu Kaisen", classification: "A16", imageName: "Jujutsu", description: "Yuji Itadori is a boy with tremendous physical strength, though he lives a completely ordinary high school life. One day, to save a classmate who has been attacked by curses, he eats the finger of Ryomen Sukuna, taking the curse into his own soul. From then on, he shares one body with Ryomen Sukuna. Guided by the most powerful of sorcerers, Satoru Gojo, Itadori is admitted to Tokyo Jujutsu High School, an organization that fights the curses... and thus begins the heroic tale of a boy who became a curse to exorcise a curse, a life from which he could never turn back.", genre: [.action, .shounen, .supernatural]),
        Item(name: "Spy x Family", classification: "A14", imageName: "spyfamily", description: "World peace is at stake and secret agent Twilight must undergo his most difficult mission yet—pretend to be a family man. Posing as a loving husband and father, he’ll infiltrate an elite school to get close to a high-profile politician. He has the perfect cover, except his wife’s a deadly assassin and neither knows each other’s identity. But someone does, his adopted daughter who’s a telepath!", genre: [.comedy, .drama, .shounen]),
        Item(name: "Boku no Hero", classification: "A12", imageName: "bokunohero", description: "Izuku has dreamt of being a hero all his life—a lofty goal for anyone, but especially challenging for a kid with no superpowers. That’s right, in a world where eighty percent of the population has some kind of super-powered “quirk,” Izuku was unlucky enough to be born completely normal. But that’s not enough to stop him from enrolling in one of the world’s most prestigious hero academies.", genre: [.action, .fantasy, .shounen]),
        Item(name: "Hunter x Hunter", classification: "A14", imageName: "hunterxhunter", description: "Gon, a young boy who lives on Whale Island, dreams of becoming a Hunter like his father, who left when Gon was still young.", genre: [.action, .comedy, .drama, .fantasy, .shounen])
    ]
    
    func popularOrUpdateAddWatch(forID id: UUID) {
        if let index = popular.firstIndex(where: { $0.id == id }) {
            popular[index].addWatchList.toggle()
        }
        if let index = updates.firstIndex(where: { $0.id == id }) {
            updates[index].addWatchList.toggle()
        }
    }

    func popularOrUpdateAddList(forID id: UUID) {
        if let index = popular.firstIndex(where: { $0.id == id }) {
            popular[index].addToAnimeList.toggle()
        }
        if let index = updates.firstIndex(where: { $0.id == id }) {
            updates[index].addToAnimeList.toggle()
        }
    }
    
    func updateOrPopularStar(forID id: UUID, count: Int) {
        if let index = popular.firstIndex(where: { $0.id == id }) {
            popular[index].starCount = count
        }
        if let index = updates.firstIndex(where: { $0.id == id }) {
            updates[index].starCount = count
        }
    }
}
