Coronary Heart Disease (CHD) Risk Score Calculator
========================================================
author: Andrew Horton
date: 6/14/2015

CHD Risk Score Calculator
========================================================

<small>
Welcome to **Coronary Heart Disease (CHD) Risk Score Calculator**. You can use this calculator to estimate your risk of having Coronary Heart Disease over the next ten years by answering a few questions.

- This calculator is based on the **The Framingham Risk Score Methodology**, which is a sex-specific algorithm used to estimate the 10-year cardiovascular risk of an individual, i.e. chances of developing cardiovascular disease.
- Coronary heart disease (CHD) risk at 10 years, as a percentage, is estimated with the help of the Framingham Risk Score.
</small>

The Application
========================================================

The Coronary Heart Disease (CHD) Risk Score calculates the user's risk points (based on the Framingham Score), risk score in % of developing a heart disease in individual over 10 years, and lastly whether this risk score is considered "Low Risk", "Intermediate Risk", or "High Risk".

The application was developed using **shiny** and deployed at https://drewsh.shinyapps.io/Developing_Data_Products.

Information Gathering
========================================================

<small>
To calculate risk points the application uses user selected data about their age, gender, smoking status, sistolic blood pressure, total and HDL cholesterol.

A user can select appropriate values using standard controls in the left panel of the application.

Users should be aware that the application defaults to a specific selections for each question, so be sure to change each appropriately.
</small>

Risk Calculation
========================================================

<small>
- To calculate risk points for men and women the application uses two different functions with the same parameters, **points.men** and **points.women**:


```r
points.men <- function(age, totchol, smoker, HDLChol, treated, SBP)
```

- Values were obtained from the input components; for example:


```r
age <- reactive({as.numeric(input$AgeSelect)})
```
</small>

Risk Calculation
========================================================

<small>
- The following operation is performed when a user clicks the **Estimate Risk** button:


```r
output$PointsOutput <- renderPrint({
            if(input$RiskButton > 0)
            {
                if(sex() == 'Male')
                {
                    points.men(age(), totchol(), smoker(), HDLChol(), treated(), SBP())
                }
                else if(sex() == 'Female')
                {
                    points.women(age(), totchol(), smoker(), HDLChol(), treated(), SBP())
                }
            }
        })
```

</small>
