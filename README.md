# Mini Katalog Uygulaması

Flutter ile geliştirilmiş modern bir e-ticaret katalog uygulaması.

## 📱 Ekran Görüntüleri

| Ana Sayfa | 

<img width="426" height="863" alt="Ekran görüntüsü 2026-05-17 213014" src="https://github.com/user-attachments/assets/df15ccfe-3875-4963-93da-5f5a5374e552" />


| Ürün Detayı |

<img width="490" height="1051" alt="Ekran görüntüsü 2026-05-18 000908" src="https://github.com/user-attachments/assets/5640a720-29bc-4bcf-8afe-5afe9265a7bb" />

<img width="471" height="1020" alt="Ekran görüntüsü 2026-05-18 000918" src="https://github.com/user-attachments/assets/cecb3138-c1b1-4bed-a49d-af8728ea7ae4" />



| Sepet |
<img width="470" height="1031" alt="Ekran görüntüsü 2026-05-18 000955" src="https://github.com/user-attachments/assets/ccc1a17c-becf-470d-8f1d-371167eb5d74" />
<img width="477" height="1015" alt="Ekran görüntüsü 2026-05-18 001008" src="https://github.com/user-attachments/assets/88ce2082-be98-45a4-8f3c-9a84c190cec3" />
<img width="465" height="1030" alt="Ekran görüntüsü 2026-05-18 001018" src="https://github.com/user-attachments/assets/071b9960-d095-4343-9e18-12cdaebb0adc" />



## ✨ Özellikler

- **Ana Sayfa** – GridView ile ürün listeleme, infinite scroll, shimmer loading
- **Arama** – Gerçek zamanlı API arama
- **Kategori Filtresi** – Yatay scroll kategori chip'leri
- **Ürün Detayı** – Görsel PageView, indirim gösterimi, adet seçici
- **Sepet** – Ürün ekleme/çıkarma, miktar güncelleme, toplam hesaplama
- **Modern UI** – Sade & temiz tasarım, animasyonlar, SnackBar bildirimleri

## 🛠 Kullanılan Teknolojiler

- **Flutter SDK** – 3.32.8 
- **Dart** – Null Safety
- **http** – API istekleri
- **cached_network_image** – Görsel önbellekleme
- **shimmer** – Loading skeleton animasyonu
- **DummyJSON API** – `https://dummyjson.com/products`

## 📁 Proje Yapısı


lib/
├── main.dart                  # Uygulama giriş noktası
├── models/
│   ├── product.dart           # Ürün modeli (fromJson)
│   └── cart_item.dart         # Sepet kalemi modeli
├── services/
│   ├── product_service.dart   # API servisi
│   └── cart_service.dart      # Sepet state yönetimi (Singleton)
├── screens/
│   ├── home_screen.dart       # Ana sayfa
│   ├── product_detail_screen.dart  # Ürün detay
│   └── cart_screen.dart       # Sepet ekranı
├── widgets/
│   ├── product_card.dart      # Ürün kartı widget
│   └── product_skeleton.dart  # Loading skeleton
└── theme/
    └── app_theme.dart         # Uygulama teması


## 🚀 Çalıştırma Adımları

### Gereksinimler
- Flutter SDK 3.32.8 
- Android Studio veya VS Code
- Android Emulator veya fiziksel cihaz


## 📦 Bağımlılıklar (pubspec.yaml)

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0
  cached_network_image: ^3.3.1
  shimmer: ^3.0.0
```

## 🎓 Öğrenme Kazanımları

- ✅ Widget ağacı ve UI mantığı
- ✅ Stateless & Stateful widget kullanımı
- ✅ Navigator.push / pop ile sayfa geçişleri
- ✅ Route Arguments ile veri taşıma
- ✅ HTTP paketi ile REST API entegrasyonu
- ✅ Model sınıfı & fromJson/toJson
- ✅ ListView.builder & GridView.builder
- ✅ Singleton pattern ile state yönetimi
- ✅ Async/await ve Future kullanımı
- ✅ CachedNetworkImage ile görsel yönetimi
