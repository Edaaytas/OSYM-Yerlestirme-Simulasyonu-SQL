# 🚀 T-SQL ile ÖSYM Yerleştirme Simülasyonu ve Akıllı Tercih Robotu

Bu proje, **MS SQL Server** üzerinde saf **T-SQL** kullanılarak geliştirilmiş minyatür bir ÖSYM yerleştirme motorudur. Sistem, ilişkisel veri tabanı mimarisi üzerinde satır satır (adım adım) çalışan gelişmiş iş mantığı kurallarını simüle eder.

## 🛠️ Kullanılan Teknolojiler ve Yapılar
- **Veri Tabanı:** MS SQL Server (SSMS)
- **T-SQL Programlama:** Stored Procedures, Cursors, Views, Conditional Logic (`IF...ELSE`), Loops (`WHILE`)
- **Veri Doğrulama:** Foreign Key, Primary Key ve `NOT NULL` kısıtlamaları

## 📌 Entegre Edilen İş Mantığı Kuralları (Business Logic)
1. **Aday Merkezli Yerleştirme:** Öğrenciler başarı sırasına göre dizilir ve yerleştirme en yüksek puanlı adaydan aşağıya doğru adayın tercih sırasına bakılarak satır satır işlenir.
2. **Taban Puan ve Doluluk Oranı Analizi:** Bölümlerin anlık doluluk oranları (%) hesaplanır ve yerleşen son adaya göre dinamik taban/tavan puanlar çıkarılır.
3. **Başarı Sırası Barajı Kontrolü:** Tıp (İlk 50k), Hukuk (İlk 125k) ve Mühendislik (İlk 300k) gibi kritik bölümlere başarı sırası barajı getirilmiştir; puanı yetse dahi barajı geçemeyen adaylar elenir.
4. **Okul Birinciliği Kontenjanı:** Genel kontenjanı dolan bölümlerde, okul birincisi olan adaylar kendilerine ayrılan özel ek kontenjanlar üzerinden yarışmaya devam eder.
5. **Akıllı Tercih Robotu (`sp_TercihRobotu`):** Girilen öğrenci ID'sine göre geçmiş taban puanları analiz ederek adaya **Garanti**, **Kritik** ve **Hayal** olmak üzere 3 kategoride akıllı tercih önerileri sunar.

## 🗺️ Gelecek Planları (Roadmap)
- [ ] Sistemden elde edilen istatistiklerin **Power BI** ile interaktif bir dashboard'a dönüştürülmesi ve harita üzerinde görselleştirilmesi.
