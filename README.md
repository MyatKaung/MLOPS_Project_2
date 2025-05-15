# 🎌 MLOps Project 2: Anime Recommender System

Welcome to the second project of our MLOps Course — **Anime Recommender System**!

This project blends **machine learning**, **software engineering**, and **DevOps/MLOps practices** to build a scalable, production-ready **anime recommendation engine**. It covers recommender system types, data pipelines, model experimentation, deployment, and CI/CD with Kubernetes.

---

![MLOps Project 2 Workflow](mlops-project2.png)

---

## 🎯 Objective

To build an end-to-end **Anime Recommender System** using:
- Content-Based Filtering
- User-Based Collaborative Filtering
- Hybrid Recommendation Techniques

---

## 📂 Dataset Overview

- **Source**: [MyAnimeList Dataset - Kaggle](https://www.kaggle.com/)
- **Size**: ~2 GB
- **Files**:
  - `anime.csv`: Metadata about 16,000+ anime
  - `anime_with_synopsis.csv`: Additional context
  - `animelist.csv`: 70 million+ user-anime interactions

🔧 **We will downsample `animelist.csv` to 5 million rows** for performance and training feasibility.

---

## 🧪 Recommender System Types Used

| Type                    | Description |
|-------------------------|-------------|
| 📘 **Content-Based**    | Recommends anime based on similar genre or storylines (e.g., Naruto → Black Clover) |
| 👥 **User-Based (Collaborative)** | Recommends based on similar user preferences |
| 🔀 **Hybrid**           | Combines content-based + collaborative filtering for more accurate results |

---

## 🏢 Target Audience

🎯 **Anime Streaming Platforms** like:
- Crunchyroll
- Netflix Anime Sections
- Fan-based anime recommender portals

**Business Use Case**:
- Increase **user retention**
- Drive **watch-time**
- Optimize **user experience**

---

## 🔄 Workflow Overview

1. **Database Setup**: Store the anime dataset in GCP Bucket (simulated)
2. **Project Setup**: Virtual environment, structure, logging, exceptions
3. **Data Ingestion**: Selective loading of data (only 5 million rows from large `animelist.csv`)
4. **Jupyter Notebook Testing**: EDA, data cleaning, model prototyping
5. **Data Processing**: Modular data transformation and feature engineering
6. **Model Architecture**: Implement hybrid recommendation system
7. **Model Training**: Train and evaluate the recommender
8. **Experiment Tracking**: Use **Comet ML** for remote model tracking (instead of MLflow)
9. **Training Pipeline**: Wrap all components into a reproducible training script
10. **Data & Code Versioning**:
    - 📁 **Data**: Versioned using **DVC** + GCP Bucket
    - 💻 **Code**: Versioned using **GitHub**
11. **Prediction Helpers**: Functions to generate user recommendations
12. **User App (Flask)**: Simple UI to enter username and display top recommendations
13. **CI/CD Deployment**:
    - Use **Jenkins** for CI/CD pipeline
    - Containerize with **Docker**
    - Store Docker image in **GCR**
    - Deploy using **Google Kubernetes Engine (GKE)**

---

## ⚙️ Tools & Technologies

| Domain              | Tools / Services                          |
|---------------------|-------------------------------------------|
| ML & EDA            | Pandas, Scikit-learn                      |
| Experiment Tracking | Comet ML                                  |
| Version Control     | GitHub (code), DVC (data) + GCP           |
| Deployment          | Jenkins, Docker, GCR, GKE (Kubernetes)    |
| Web App             | Flask, HTML/CSS                           |

---

## 🏆 Key MVPs

1. ✅ **Hybrid Recommender System** implementation
2. 📈 **Experiment Tracking** using **Comet ML**
3. ⛓️ **Data Versioning** using **DVC + GCP Buckets**
4. 🚀 **CI/CD Pipeline Deployment** using:
   - Jenkins
   - Docker
   - GCR
   - Google Kubernetes Engine (GKE)

---

## ☁️ Why Kubernetes (GKE)?

| Option        | Drawbacks                                                                 | Kubernetes Advantage                          |
|---------------|---------------------------------------------------------------------------|-----------------------------------------------|
| VM Instances  | Manual setup, always-on billing, non-scalable                             | Auto-scaled pods based on real-time load       |
| Cloud Run     | Limited customization, good only for small apps                           | Highly customizable, suited for production     |
| GKE           | ✅ Autoscaling, cost-efficient, production-ready deployments               | ✅ Recommended for scalable ML systems         |

---

## 📌 Deployment Recap

1. Build Docker Image → Push to GCR  
2. Set up Jenkinsfile for CI/CD  
3. Deploy to GKE with auto-scaling  
4. Monitor health via Kubernetes Dashboard




