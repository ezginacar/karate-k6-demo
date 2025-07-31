# Karate-K6 Demo Project

Bu proje, Karate framework kullanarak Trello API'si üzerinde E2E testler yapan bir demo projesidir.

## 🚀 Features

- **Karate Framework** ile API testleri
- **Trello API** entegrasyonu
- **Docker** desteği
- **Maven** build sistemi
- **Java 11** runtime
- **E2E Test** senaryosu

## 📋 Gereksinimler

### Docker ile (Önerilen)
- Docker Desktop
- Git

### Manuel Kurulum
- Java 11+
- Maven 3.6+
- Git

## 🐳 Docker ile Hızlı Başlangıç

### 1. Projeyi Klonlayın
```bash
git clone <repository-url>
cd Karate-K6-Demo
```

### 2. Docker ile Testleri Çalıştırın
```bash
# Testleri çalıştır
docker compose up --build karate-tests

# Veya sadece build et
docker build -t karate-k6-demo .
docker run --rm karate-k6-demo

# Farklı Maven komutları
docker run --rm karate-k6-demo clean install
docker run --rm karate-k6-demo clean compile
docker run --rm karate-k6-demo dependency:tree
```

### 3. Geliştirme Modu
```bash
# Development container başlat
docker compose --profile dev up -d karate-dev

# Container'a bağlan
docker exec -it karate-k6-dev bash

# Container içinde test çalıştır
mvn clean test

# Veya direkt Docker run ile
docker run --rm -it karate-k6-demo bash
```

## 🔧 Manuel Kurulum

### 1. Java 11 Kurulumu
```bash
# macOS
brew install openjdk@11
export JAVA_HOME=/opt/homebrew/opt/openjdk@11

# Ubuntu/Debian
sudo apt-get install openjdk-11-jdk

# Windows
# Oracle JDK 11 indirin ve kurun
```

### 2. Maven Kurulumu
```bash
# macOS
brew install maven

# Ubuntu/Debian
sudo apt-get install maven

# Windows
# Maven binary'lerini indirin ve PATH'e ekleyin
```

### 3. Projeyi Çalıştırın
```bash
# Dependencies'leri indir
mvn dependency:resolve

# Testleri çalıştır
mvn clean test
```

## 📁 Proje Yapısı

```
Karate-K6-Demo/
├── src/
│   ├── test/
│   │   ├── java/
│   │   │   └── runner/
│   │   │       └── TestRunner.java
│   │   └── resources/
│   │       ├── features/
│   │       │   └── CaseStudy.feature
│   │       ├── karate-config.js
│   │       ├── header.js
│   │       ├── faker-helpers.js
│   │       ├── DataCleanup.js
│   │       └── logback-test.xml
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
├── pom.xml
└── README.md
```

## 🧪 Test Senaryoları

### E2E Trello Workflow
- **Organization** oluşturma
- **Board** oluşturma
- **List** oluşturma
- **Card** oluşturma ve güncelleme
- **Resource cleanup** (otomatik temizlik)

### Test Özellikleri
- ✅ **Random data generation** (JavaFaker)
- ✅ **Resource tracking** (otomatik cleanup)
- ✅ **Clean logging** (console'da temiz çıktı)
- ✅ **Error handling**
- ✅ **Docker support** (platform bağımsız)
- ✅ **Parallel execution** desteği

## 🔑 Konfigürasyon

### API Keys
Trello API için gerekli bilgiler `src/test/resources/karate-config.js` dosyasında:

```javascript
var config = {
    accessToken: 'your-access-token',
    apiKey: 'your-api-key',
    baseUrl: 'https://api.trello.com'
}
```

### Environment Variables
```bash
# Docker ile
export TRELLO_API_KEY=your-api-key
export TRELLO_ACCESS_TOKEN=your-access-token

# Manuel kurulum
export JAVA_HOME=/path/to/java11
export MAVEN_OPTS="-Xmx512m"
```

## 📊 Test Raporları

Test sonuçları şu konumlarda bulunur:
- **HTML Rapor**: `target/karate-reports/karate-summary.html`
- **JSON Rapor**: `target/karate-reports/`
- **Console Output**: Detaylı logging

## 🐛 Sorun Giderme

### Docker Sorunları
```bash
# Docker daemon kontrolü
docker ps

# Container logları
docker logs karate-k6-demo

# Container'a bağlan
docker exec -it karate-k6-demo bash
```

### Maven Sorunları
```bash
# Clean build
mvn clean install

# Debug mode
mvn clean test -X

# Dependency tree
mvn dependency:tree
```

### Java Sorunları
```bash
# Java version kontrolü
java -version

# JAVA_HOME kontrolü
echo $JAVA_HOME
```

## 🚨 Bilinen Sorunlar

1. **Maven Warnings**: JUnit dependency versiyonları (kritik değil)
2. **API Rate Limits**: Trello API limitleri
3. **Docker Volume Mount**: Maven clean ile çakışma (çözüldü)

## 🤝 Katkıda Bulunma

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Commit yapın (`git commit -m 'Add amazing feature'`)
4. Push yapın (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## 📝 Lisans

Bu proje MIT lisansı altında lisanslanmıştır.

## 📞 İletişim

- **Proje Sahibi**: [Your Name]
- **Email**: [your.email@example.com]
- **GitHub**: [your-github-profile]

---

## 🎯 Hızlı Test

```bash
# Docker ile tek komut
docker run --rm karate-k6-demo

# Docker Compose ile
docker compose up --build karate-tests

# Manuel kurulum ile
mvn clean test
```

**Not**: İlk çalıştırmada Maven dependencies'leri indirileceği için biraz zaman alabilir. 