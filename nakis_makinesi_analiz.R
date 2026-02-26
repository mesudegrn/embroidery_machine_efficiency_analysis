library(readxl)

# Load required library
library(openxlsx)
library(graphics)
library(writexl)
library(qcc)


data <- read_excel("C:/kizilay/data/nakis_verileri.xlsx", sheet = 1)



#plot(x = data$makine_hizi_dk, 
#     y = data$birim_sure, 
#    xlab = "Makine Hizi", 
#     ylab = "Birin Sure Sure (sn)", 
#     main = "Makine Hizina Gore Birim Sure")

model2 <- lm(birim_sure ~ poly(makine_hizi_dk), data = data)
plot(data$makine_hizi_dk, data$birim_sure, pch = 19, col = "darkgreen")
lines(sort(data$makine_hizi_dk),
      predict(model2, newdata = data.frame(makine_hizi_dk = sort(data$makine_hizi_dk))),
      col = "blue", lwd = 2)


# Grafik çiz
#model <- lm(birim_sure ~ makine_hizi_dk, data = data)

#plot(data$makine_hizi_dk, data$birim_sure,
#     xlab = "Makine Hizi",
#     ylab = "Birim Sure",
#     main = "Regresyon Cizgisi",
#     pch = 19, col = "darkgreen")

# Regresyon doğrusunu çiz
#abline(model, col = "blue", lwd = 2)




#####################################################################################################################
#####################################################################################################################
#####################################################################################################################




#Makine Hızı vs. Birim süre


# Model kur
model2 <- lm(birim_sure ~ poly(makine_hizi_dk, 2), data = data)

# Yeni tahmin verisi olustur
new_hiz <- data.frame(makine_hizi_dk = seq(min(data$makine_hizi_dk), max(data$makine_hizi_dk), length.out = 100))
new_hiz$predicted <- predict(model2, newdata = new_hiz)

# En kucuk tahmin edilen sureyi bul
min_row <- new_hiz[which.min(new_hiz$predicted), ]

# Grafik ciz
plot(data$makine_hizi_dk, data$birim_sure,
     pch = 19, col = "darkgreen",
     xlab = "Makine Hizi (dk)", ylab = "Birim Sure (sn)",
     main = "Polinom Regresyon & Minimum Nokta")

# Polinom regresyon egriyi ciz
lines(new_hiz$makine_hizi_dk, new_hiz$predicted, col = "blue", lwd = 2)

# Minimum noktayi isaretle
points(min_row$makine_hizi_dk, min_row$predicted, col = "red", pch = 19, cex = 2)



ideal_kumas <- as.integer(7)


# Minimum tahmin edilen satırı yazdır
cat("En uygun makine hizi:", min_row$makine_hizi_dk, "\n")
cat("Tahmini birim sure (sn):", round(min_row$predicted, 2), "\n")
min_row$total_time <- ideal_kumas * min_row$predicted
cat("Tahmini toplam sure (sn):", round(min_row$total_time, 2), "\n")






#####################################################################################################################
#####################################################################################################################
#####################################################################################################################







#KUMAŞ SAYISI vs BİRİM SÜRE



# Model kur
model2 <- lm(birim_sure ~ poly(kumas_sayisi, 2), data = data)

# Yeni tahmin verisi olustur
new_kumas <- data.frame(kumas_sayisi = seq(min(data$kumas_sayisi), max(data$kumas_sayisi), length.out = 100))
new_kumas$predicted <- predict(model2, newdata = new_kumas)

# En kucuk tahmin edilen sureyi bul
min_row <- new_kumas[which.min(new_kumas$predicted), ]

# Grafik ciz
plot(data$kumas_sayisi, data$birim_sure,
     pch = 19, col = "darkgreen",
     xlab = "Makine Hizi (dk)", ylab = "Birim Sure (sn)",
     main = "Polinom Regresyon & Minimum Nokta")

# Polinom regresyon egriyi ciz
lines(new_kumas$kumas_sayisi, new_kumas$predicted, col = "blue", lwd = 2)

# Minimum noktayi isaretle
points(min_row$kumas_sayisi, min_row$predicted, col = "red", pch = 19, cex = 2)




cat("En uygun kumaş sayısı:", min_row$kumas_sayisi, "\n")
cat("Tahmini birim sure (sn):", round(min_row$predicted, 2), "\n")
min_row$total_time <- min_row$kumas_sayisi * min_row$predicted
cat("Tahmini toplam sure (sn):", round(min_row$total_time, 2), "\n")







#####################################################################################################################
#####################################################################################################################
#####################################################################################################################







#MAKİNE HIZI vs HATA SAYISI

data$hata_sayisi <- data$ip_kopmasi + data$igne_kirma + data$ip_degistirme + data$ip_alamama
print(data$hata_sayisi)




# Model kur
model2 <- lm(hata_sayisi ~ poly(makine_hizi_dk, 2), data = data)

# Yeni tahmin verisi olustur
new_hiz <- data.frame(makine_hizi_dk = seq(min(data$makine_hizi_dk), max(data$makine_hizi_dk), length.out = 100))
new_hiz$predicted <- predict(model2, newdata = new_hiz)

# En kucuk tahmin edilen sureyi bul
min_row <- new_hiz[which.min(new_hiz$predicted), ]

# Grafik ciz
plot(data$makine_hizi_dk, data$hata_sayisi,
     pch = 19, col = "darkgreen",
     xlab = "Makine Hizi (dk)", ylab = "Hata Sayısı",
     main = "Polinom Regresyon & Minimum Nokta")

# Polinom regresyon egriyi ciz
lines(new_hiz$makine_hizi_dk, new_hiz$predicted, col = "blue", lwd = 2)

# Minimum noktayi isaretle
points(min_row$makine_hizi_dk, min_row$predicted, col = "red", pch = 19, cex = 2)









#####################################################################################################################
#####################################################################################################################
#####################################################################################################################






#KUMAŞ SAYISI vs HATA SAYISI



# Model kur
model2 <- lm(hata_sayisi ~ poly(kumas_sayisi, 2), data = data)

# Yeni tahmin verisi olustur
new_kumas <- data.frame(kumas_sayisi = seq(min(data$kumas_sayisi), max(data$kumas_sayisi), length.out = 100))
new_kumas$predicted <- predict(model2, newdata = new_kumas)

# En kucuk tahmin edilen sureyi bul
min_row <- new_kumas[which.min(new_kumas$predicted), ]

# Grafik ciz
plot(data$kumas_sayisi, data$hata_sayisi,
     pch = 19, col = "darkgreen",
     xlab = "Kumaş Sayısı", ylab = "Hata Sayısı",
     main = "Polinom Regresyon & Minimum Nokta")

# Polinom regresyon egriyi ciz
lines(new_kumas$kumas_sayisi, new_kumas$predicted, col = "blue", lwd = 2)

# Minimum noktayi isaretle
points(min_row$kumas_sayisi, min_row$predicted, col = "red", pch = 19, cex = 2)





#####################################################################################################################
#####################################################################################################################
#####################################################################################################################








#İŞÇİ SAYISI vs BİRİM SÜRE



boxplot(birim_sure ~ isci_sayisi, data = data,
        main = "İsci Sayisina Gore Birim Sure Dagilimi",
        xlab = "İsci Sayisi", ylab = "Birim Sure (sn)",
        col = c("#f4a261", "#2a9d8f"))

aggregate(birim_sure ~ isci_sayisi, data = data, FUN = mean)










#İŞÇİ SAYISI vs HATA SAYISI



boxplot(hata_sayisi ~ isci_sayisi, data = data,
        main = "İsci Sayisina Gore Hata Sayisi Dagilimi",
        xlab = "İsci Sayisi", ylab = "Hata Sayisi",
        col = c("#f4a261", "#2a9d8f"))

aggregate(hata_sayisi ~ isci_sayisi, data = data, FUN = mean)








#####################################################################################################################
#####################################################################################################################
#####################################################################################################################







# Lineer model kur
model <- lm(birim_sure ~ kumas_sayisi + makine_hizi_dk + isci_sayisi + nakis_turu + ip_kopmasi,
            data = data)

# ANOVA tablosu
anova(model)

# Modelin özeti
summary(model)






#c
#plot(model,1)
#plot(model,2)
#qcc(rstandard(model), type = "xbar.one", plot = TRUE)
#hist(rstandard(model), main = "Histogram", xlab = "Standardized Residuals", ylab = "Frequency", breaks=9)





# Adım 1: Kategorik olan 'nakis_turu'yu factor olarak belirt
nakis_levels <- levels(model$model$nakis_turu)


new_data$kumas_sayisi_poly <- poly(new_data$kumas_sayisi, 2, raw = TRUE)
model <- lm(birim_sure ~ poly(kumas_sayisi, 2, raw = TRUE) + makine_hizi_dk + isci_sayisi + ip_kopmasi + nakis_turu, data = data)


data$kumas_sayisi2 <- data$kumas_sayisi^2
model <- lm(birim_sure ~ kumas_sayisi + kumas_sayisi2 + makine_hizi_dk + isci_sayisi + ip_kopmasi + nakis_turu, data = data)

new_data <- data.frame(
  kumas_sayisi = 1:15,
  kumas_sayisi2 = (1:15)^2,
  makine_hizi_dk = mean(data$makine_hizi_dk),
  isci_sayisi = mean(data$isci_sayisi),
  ip_kopmasi = mean(data$ip_kopmasi),
  nakis_turu = factor("kirmizi_arma", levels = levels(data$nakis_turu))
)


# Bu değerlere göre tahmin yap
predictions <- predict(model, newdata = new_data, interval = "prediction", level = 0.95)

# Tahmin sonuçlarını görüntüle
print(predictions)




sum(is.na(data))
summary(model)






data$kumas_sayisi2 <- data$kumas_sayisi^2


model <- lm(birim_sure ~ kumas_sayisi + kumas_sayisi2 + 
              makine_hizi_dk + isci_sayisi + ip_kopmasi + nakis_turu, data = data)



nakis_levels <- levels(data$nakis_turu)

new_data <- data.frame(
  kumas_sayisi = 1:15,
  kumas_sayisi2 = (1:15)^2,
  makine_hizi_dk = mean(data$makine_hizi_dk, na.rm = TRUE),
  isci_sayisi = mean(data$isci_sayisi, na.rm = TRUE),
  ip_kopmasi = mean(data$ip_kopmasi, na.rm = TRUE),
  nakis_turu = factor("kirmizi_arma", levels = nakis_levels)
)



predictions <- predict(model, newdata = new_data, interval = "prediction")
print(predictions)




