// Hesap Makinesi
// Değişkenler (let -> immutable, var -> mutable)
// Operatörler (toplama, çıkarma, çarpma, bölme, mod)
// Async metodlar
// If condition ile hata kontrolü
// Gelişmiş Matematiksel Fonksiyonlar
// Kullanıcı Tabanlı İşlemler
// Geçmiş Kaydı ve Görüntüleme
// Canister => Akıllı Sözleşme

actor hesap_makinesi {
    var hucre: Int = 0; // Hesap makinesinin mevcut değeri
    var gecmis: [Text] = []; // İşlem geçmişi

    // Toplama Fonksiyonu
    public func toplama(s: Int): async Int {
        hucre += s; // Girilen değeri ekle
        gecmise_ekle("Toplama", hucre); // İşlem geçmişine ekle
        hucre
    };

    // Çıkarma Fonksiyonu
    public func cikarma(s: Int): async Int {
        hucre -= s;
        gecmise_ekle("Çıkarma", hucre);
        hucre
    };

    // Çarpma Fonksiyonu
    public func carpma(s: Int): async Int {
        hucre *= s;
        gecmise_ekle("Çarpma", hucre);
        hucre
    };

    // Bölme Fonksiyonu
    public func bolme(s: Int): async ?Int {
        if (s == 0) {
            null
        } else {
            hucre /= s;
            gecmise_ekle("Bölme", hucre);
            ?hucre
        }
    };

    // Mod Alma Fonksiyonu
    public func mod_alma(s: Int): async ?Int {
        if (s == 0) {
            null
        } else {
            hucre := hucre % s;
            gecmise_ekle("Mod Alma", hucre);
            ?hucre
        }
    };

    // Üs Alma Fonksiyonu
    public func us_alma(tab: Int, us: Int): async Int {
        let sonuc = Int.pow(tab, us);
        gecmise_ekle("Üs Alma", sonuc);
        sonuc
    };

    // Karekök Alma Fonksiyonu
    public func karekok_alma(sayi: Int): async ?Float {
        if (sayi < 0) {
            null
        } else {
            let sonuc = Float.sqrt(Float.fromInt(sayi));
            gecmise_ekle("Karekök Alma", Int.fromFloat(sonuc));
            ?sonuc
        }
    };

    // Rastgele Sayı Üretimi
    public func rastgele_sayi(): async Int {
        let rastgele = Random.randInt(100);
        gecmise_ekle("Rastgele Sayı Üretimi", rastgele);
        rastgele
    };

    // Kullanıcıdan Girişle İşlem
    public func kullanici_islemi(islem: Text, s: Int): async ?Int {
        if (islem == "toplama") {
            return ?await toplama(s);
        } else if (islem == "cikarma") {
            return ?await cikarma(s);
        } else if (islem == "carpma") {
            return ?await carpma(s);
        } else if (islem == "bolme") {
            return await bolme(s);
        } else if (islem == "mod") {
            return await mod_alma(s);
        } else {
            null
        }
    };

    // Geçmişe İşlem Ekleme
    private func gecmise_ekle(islem: Text, sonuc: Int): async () {
        gecmis := gecmis # [islem # ": " # Int.toText(sonuc)];
    };

    // İşlem Geçmişini Görüntüleme
    public func gecmisi_goster(): async [Text] {
        gecmis
    };

    // Temizle Fonksiyonu
    public func temizle(): async () {
        hucre := 0;
        gecmise_ekle("Hafıza Temizleme", hucre);
    };

    // Mevcut Değeri Görüntüleme
    public func goster(): async Int {
        hucre
    };
};
