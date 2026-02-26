# 🧵 Kizilay Shelter Systems: Embroidery Production Optimization

This repository contains a specialized **R-based statistical framework** developed for **Kizilay Shelter Systems**. The project applies advanced data modeling techniques to optimize industrial embroidery machine performance and minimize production errors in humanitarian aid manufacturing.

---

## 🎯 Project Overview
In a production environment where every second counts, this tool identifies the "mathematical sweet spot" for manufacturing. By analyzing machine logs, it determines the most efficient speed and labor configuration to maximize output without compromising quality.

## 🛠️ Technical Features & Statistical Methods

### 1. Polynomial Optimization (Quadratic Modeling)
The script uses **Polynomial Regression** ($y = \beta_0 + \beta_1x + \beta_2x^2$) to detect the vertex of efficiency curves. It automatically identifies:
* **Optimal Machine Speed:** The exact RPM that minimizes unit production time.
* **Error Minimization:** Analyzing the relationship between speed and failure modes (thread breaks, needle snaps, etc.) to find the "safest" operating speed.
* **Batch Optimization:** Determining how fabric quantity impacts the unit processing time.

### 2. Predictive Analytics
A **Multiple Linear Regression (MLR)** model is used to forecast production outcomes. 
* **Variables:** Incorporates fabric count, machine speed, worker count, embroidery type, and historical error rates.
* **Confidence:** Generates **95% Prediction Intervals** for production forecasting, allowing for robust supply chain planning.

### 3. Quality Control & Performance
* **ANOVA:** Performs Analysis of Variance to determine which factors (e.g., worker count vs. embroidery type) significantly impact production speed.
* **Error Diagnostics:** Aggregates various failure types into a composite "Error Score" for holistic machine health monitoring.
* **Comparative Visuals:** Uses Boxplots and Regression Plots to visualize performance across different shifts and machine setups.

## 📊 Tech Stack
* **Language:** R
* **Libraries:** * `readxl` & `openxlsx`: Data I/O
  * `stats`: Linear and Polynomial modeling
  * `qcc`: Quality Control Charts
  * `graphics`: High-resolution regression and residual plots

## 🚀 How to Use
1. **Clone the repository:**
   ```bash
   git clone [https://github.com/yourusername/kizilay-embroidery-optimization.git](https://github.com/yourusername/kizilay-embroidery-optimization.git)
