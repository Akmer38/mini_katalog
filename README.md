# 📱 Mini Katalog

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.32.8-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-Null%20Safety-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/Android-Destekleniyor-3DDC84?style=for-the-badge&logo=android&logoColor=white" />
  <img src="https://img.shields.io/badge/iOS-Destekleniyor-000000?style=for-the-badge&logo=apple&logoColor=white" />
</p>

<p align="center">
  Modern Flutter mimarisi ile geliştirilmiş, şık tasarımlı mini e-ticaret katalog uygulaması.
</p>

<<<<<<< HEAD
---

## 📸 Ekran Görüntüleri

### Ana Sayfa

<img width="426" height="863" alt="Ana Sayfa" src="https://github.com/user-attachments/assets/df15ccfe-3875-4963-93da-5f5a5374e552" />

---

### Ürün Detayı

<img width="490" height="1051" alt="Ürün Detayı 1" src="https://github.com/user-attachments/assets/5640a720-29bc-4bcf-8afe-5afe9265a7bb" />

<img width="471" height="1020" alt="Ürün Detayı 2" src="https://github.com/user-attachments/assets/cecb3138-c1b1-4bed-a49d-af8728ea7ae4" />

---

### Sepet

<img width="470" height="1031" alt="Sepet 1" src="https://github.com/user-attachments/assets/ccc1a17c-becf-470d-8f1d-371167eb5d74" />

<img width="477" height="1015" alt="Sepet 2" src="https://github.com/user-attachments/assets/88ce2082-be98-45a4-8f3c-9a84c190cec3" />

<img width="465" height="1030" alt="Sepet 3" src="https://github.com/user-attachments/assets/071b9960-d095-4343-9e18-12cdaebb0adc" />

---


## ✨ Özellikler

- 🏠 **Ana Sayfa** – GridView ile ürün listeleme, infinite scroll, shimmer loading
- 🔍 **Arama** – Gerçek zamanlı API araması
- 🗂️ **Kategori Filtresi** – Yatay scroll kategori chip'leri
- 📄 **Ürün Detayı** – Görsel PageView carousel, indirim gösterimi, adet seçici
- ⭐ **Yorumlar** – Kullanıcı yorumları ve yıldız puanlaması
- 🚚 **Ürün Bilgileri** – Kargo, garanti ve iade politikası
- 📦 **Min. Sipariş Kontrolü** – Minimum sipariş adedi doğrulaması
- 🛒 **Sepet** – Ürün ekleme/çıkarma, miktar güncelleme, toplam hesaplama
- 🎨 **Modern UI** – Sade & temiz tasarım, animasyonlar, SnackBar bildirimleri

---

<<<<<<< HEAD
## 🛠️ Kullanılan Teknolojiler

| Paket | Versiyon | Açıklama |
|-------|----------|----------|
| `flutter` | 3.32.8 | Temel framework |
| `http` | ^1.2.0 | REST API istekleri |
| `cached_network_image` | ^3.3.1 | Görsel önbellekleme |
| `shimmer` | ^3.0.0 | Loading skeleton animasyonu |

**API:** [DummyJSON](https://dummyjson.com/products) — `https://dummyjson.com/products`

---
=======
- **Flutter SDK** – 3.32.8 
- **Dart** – Null Safety
- **http** – API istekleri
- **cached_network_image** – Görsel önbellekleme
- **shimmer** – Loading skeleton animasyonu
- **DummyJSON API** – `https://dummyjson.com/products`
>>>>>>> 511fba5f494d626ff8cbed986c9878094d51ff22

## 📁 Proje Yapısı

```
lib/
├── main.dart                       # Uygulama giriş noktası
├── models/
│   ├── product.dart                # Ürün modeli (fromJson)
│   └── cart_item.dart              # Sepet kalemi modeli
├── services/
│   ├── product_service.dart        # API servisi
│   └── cart_service.dart           # Sepet state yönetimi (Singleton)
├── screens/
│   ├── home_screen.dart            # Ana sayfa
│   ├── product_detail_screen.dart  # Ürün detay ekranı
│   └── cart_screen.dart            # Sepet ekranı
├── widgets/
│   ├── product_card.dart           # Ürün kartı widget
│   └── product_skeleton.dart       # Loading skeleton
└── theme/
    └── app_theme.dart              # Uygulama teması
```

---

## 🚀 Kurulum

### Gereksinimler
<<<<<<< HEAD

- Flutter SDK `3.32.8`
- Android Studio veya VS Code
- Android Emulator veya fiziksel cihaz

### Adımlar

```bash
# Repoyu klonla
git clone https://github.com/kullaniciadi/mini_katalog.git

# Proje klasörüne gir
cd mini_katalog

# Bağımlılıkları yükle
flutter pub get

# Uygulamayı çalıştır
flutter run
```

---

## 📦 Bağımlılıklar
=======
- Flutter SDK 3.32.8 
- Android Studio veya VS Code
- Android Emulator veya fiziksel cihaz


## 📦 Bağımlılıklar (pubspec.yaml)
>>>>>>> 511fba5f494d626ff8cbed986c9878094d51ff22

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0
  cached_network_image: ^3.3.1
  shimmer: ^3.0.0
```

---

## 🎓 Öğrenme Kazanımları

- ✅ Widget ağacı ve UI mantığı
- ✅ Stateless & Stateful widget kullanımı
- ✅ Navigator.push / pop ile sayfa geçişleri
- ✅ Route Arguments ile veri taşıma
- ✅ HTTP paketi ile REST API entegrasyonu
- ✅ Model sınıfı & fromJson / toJson
- ✅ ListView.builder & GridView.builder
- ✅ Singleton pattern ile state yönetimi
- ✅ Async / await ve Future kullanımı
- ✅ CachedNetworkImage ile görsel yönetimi

---

> Bu proje eğitim ve portföy amaçlı geliştirilmiştir. Gerçek bir e-ticaret altyapısı içermez.
