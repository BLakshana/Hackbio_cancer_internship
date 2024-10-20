# **HackBio Internship: Stage 3**

**Authors (@slack):**   
Lakshana Bakthavachalam **(@Lakshana),**  Nada ElSayed Ahmed **(@Nada\_EA)**

**Link to MD File: [https://github.com/Nada-EA/HackBio2024-AMR/blob/main/Stage3/Final%20Report.md](https://github.com/Nada-EA/HackBio2024-AMR/blob/main/Stage3/Final%20Report.md)**

**Link to GitHub repo: [https://github.com/Nada-EA/HackBio2024-AMR/tree/main/Stage3](https://github.com/Nada-EA/HackBio2024-AMR/tree/main/Stage3)**

---

## **Phase I**

**Google Doc:** [https://docs.google.com/document/d/1V0sQZQAMyaK9svz\_VcVEsrdnY6KWJLA7qIHcCffQY0A/edit\#heading=h.6o1oyespi2s2](https://docs.google.com/document/d/1V0sQZQAMyaK9svz_VcVEsrdnY6KWJLA7qIHcCffQY0A/edit#heading=h.6o1oyespi2s2)

---

## **Phase II**

## **Global Cholera Outbreaks (1949 \- 2016\)**

The “Cholera outbreak” data was obtained from the Global Health Observatory (GHO), a data repository of WHO, which provides information about the health-related statistics for its 194 member countries. The data was pre-processed and visualized using R, based on three key parameters: number of cases, number of deaths, and case fatality rate.

 
![map_cases](https://github.com/user-attachments/assets/e854a306-ef6f-4c1d-8a79-be8fe1ce2dab)


**Fig1: HOTSPOTS OF CHOLERA OUTBREAK**

---

Between 1949 and 2016, India had the largest cholera outbreaks, followed by Peru and Democratic Republic of Congo. Other countries like Afghanistan, Bangladesh,  Malawi, Madagascar, Somalia, Tanzania, also experienced an outbreak but it was not alarming (in terms of scale) when compared to India and Peru. Among the listed countries, Bangladesh and DRC are classified as endemic regions.


![Country_total_metric](https://github.com/user-attachments/assets/2c6fbfe2-5218-4618-beb7-a283c6c405b1)


**Fig2: TOP 20 COUNTRIES MOST AFFECTED BY CHOLERA**

The bar graph highlights the top 20 countries that were most affected by cholera. Despite the alarming case numbers, the fatality rate is found to be under control. For instance, the number of cases exceeds over 1 million in India; however, the fatality is less than 50% of the case total. A similar pattern is also observed in Bangladesh.

---

![Cases_years](https://github.com/user-attachments/assets/9e41ea76-f10a-4080-92fd-a211602f2e07)


**Fig3: TRENDS IN CHOLERA CASES \- 1949 TO 2016**

In 1949, approximately 0.2 million cases of cholera were reported worldwide. This number sharply decreased to 0.1 million by 1954 and remained as such until 1990, with minor fluctuations. However, in the year 1991, the cases surged and attained a highest peak of 0.6 million before gradually declining to around 0.1 million by the end of 1999\. From 2000 to 2010, the trend stabilized between 0.1 and 0.2 million cases, until a peak similar to that of 1991 occurred again in 2011, after which it diminished back to normal level by 2016\.

### 

### 

### 

### 

### 

### 
---

![Case_Fatality_years](https://github.com/user-attachments/assets/494df654-e307-426c-8456-c20e71b7ade4)


**Fig4: TRENDS IN CASE FATALITY  \- 1949 TO 2016**

From 1949 to 1960, the average case fatality rate was quite high. However, after 1960, it gradually declined and stabilized at under 10 (in number) throughout the following years. With reference to Fig3, the case number surged to 0.6 million in both 1991 and 2011, whereas the case-fatality rate during those years were low, reflecting advancements in medical development and public health interventions.

---

## Nigeria (1970 \- 2016\)

## **Key Metrics**

### **Total Cases:** 310217

### **Total Fatalities:** 21479

### **Average Case-Fatality Rate:** 6.92%

## **Summary:**

1\. Number of Cases:

* Highest number of cases in Nigeria: 59478 in the year 1991  
* Lowest number of cases in Nigeria: 15 in the year 1970

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

2\. Number of Fatalities:

* Highest number of fatalities in Nigeria: 7654 in the year 1991  
* Lowest number of fatalities in Nigeria: 0 in the year 1985

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

3\. Case-Fatality Rate (CFR):

* Highest Case-fatality Rate in Nigeria: 26.67 in the year 1970  
* Lowest Case-fatality Rate in Nigeria: 0 in the year 1985


## **Cholera Outbreak Graph:** 

![Nigeria](https://github.com/user-attachments/assets/4d27e545-081b-4769-a569-037283d8bafb)

---


## **Shiny App: CholeraWatch**

## **Link to app: [https://jpjxx1-nada-ahmed.shinyapps.io/cholerawatch/](https://jpjxx1-nada-ahmed.shinyapps.io/cholerawatch/)**

![Nigera_CholeraWatch](https://github.com/user-attachments/assets/bb469d89-6b61-44f6-9149-c810a06e3d72)


The CholeraWatch interactive app enables users to explore cholera outbreaks globally, based on WHO data from 1949 to 2016\. Users can select a country from a list and view key metrics, including total cases, total fatalities, and the case-fatality rate, which are displayed in three info boxes. Additionally, users can customize the time range to analyze trends over specific periods. For each selected country, the app also generates a plot with three graphs, visualizing the same metrics—total cases, total fatalities, and case-fatality rate—over time.

---

## **Data Source:** 

World Health Organization Global Health Observatory data repository: Cholera  
[https://apps.who.int/gho/data/node.main.174?lang=en](https://apps.who.int/gho/data/node.main.174?lang=en)  


[image1]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAkCAYAAAD7PHgWAAABpklEQVR4Xu2VsU7CQBzGmVx8BUeegIEHkIaOLjjpTIAuPAJONp0d9BmIE3EjroRITDfciAnQ0tCIRgNqzNkPe1rvFNqjaRnuS740tLnv+7V3+ZPJSElJSW2farVatlqtHnvXhufTiG74a7NsbiyqVCqqruvnpmnejcfjheM4JIqxBmuRgSw2fyPhrQ3DuPBK5mxxVCMDWbF+SWwN3p4tEzWykMn2CAvnR2Rb/7NlWa8e4AnbIywcctu2SZxGJtsjLIT1+30Sp4UBi8XivqqqdcbtZvOSBN3r3ZK39w9hCwMCiIQQIJ9f5lxxWAsD0i84HDlklQE4caZccVgLA0KFQkFZBwnA4cjiisN6I0CIQtoTl4NLHZBuM86a6z5ycKkChoFLDXAV3BcQ+ztBwFVwmIOt1tUvyEQB18DVFUVpDQb3pNPpfkMmCkjhpu6Mg8vlckelUumMDuVu92YJ125fJzcH/xrOFM57vFcul41gOGAfZk/J/pMEh3MQzvMOwtiCTR0ZEKKQ+Xz+MOPD4f7WAPoC1K5/XUrTtAMExmlk/lRKSUlJJa5PbK0yKomJVB4AAAAASUVORK5CYII=>
