// Hesap Makinesi
// Değişkenler (let -> immutable, var -> mutable)
// Operatörler (toplama, çıkarma, çarpma, bölme)
// Async metodlar
// If condition ile hata kontrolü
// Canister => Akıllı Sözleşme

actor hesap_makinesi {
    var hucre: Int = 0; // Hesap makinesinin mevcut değeri

    // Toplama Fonksiyonu
    public func toplama(s: Int): async Int {
        hucre += s; // Girilen değeri ekle
        hucre       // Güncellenen değeri döndür
    };

    // Çıkarma Fonksiyonu
    public func cikarma(s: Int): async Int {
        hucre -= s; // Girilen değeri çıkar
        hucre       // Güncellenen değeri döndür
    };

    // Çarpma Fonksiyonu
    public func carpma(s: Int): async Int {
        hucre *= s; // Girilen değerle çarp
        hucre       // Güncellenen değeri döndür
    };

    // Bölme Fonksiyonu
    public func bolme(s: Int): async ?Int {
        if (s == 0) {
            null // Sıfıra bölünme hatası
        } else {
            hucre /= s; // Bölme işlemini gerçekleştir
            ?hucre       // Güncellenen değeri döndür
        };
    };

    // Mod Alma Fonksiyonu (Ekstra Özellik)
    public func mod_alma(s: Int): async ?Int {
        if (s == 0) {
            null // Sıfıra göre mod alınamaz
        } else {
            hucre := hucre % s; // Mod işlemi
            ?hucre
        };
    };

    // Kullanıcıdan Giriş Alarak İşlem Yapan Fonksiyon
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
            null // Geçersiz işlem
        };
    };

    // Temizle Fonksiyonu (Hafızayı sıfırlar)
    public func temizle(): async () {
        hucre := 0; // Hücreyi sıfırla
    };

    // Mevcut Değeri Görüntüleme
    public func goster(): async Int {
        hucre // Mevcut hücre değerini döndür
    };
};
